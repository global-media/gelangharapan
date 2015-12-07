class PaymentsController < ApplicationController
  before_filter :validate_login
  skip_before_filter :verify_authenticity_token, only: [:receive_webhook]
  before_filter :validate_order_id, only: [:notification, :success, :error]
  before_filter :validate_cart, :validate_shipping, only: [:checkout]
  before_filter :validate_product, only: [:checkout]
  
  protect_from_forgery with: :null_session
  
  def checkout
    @order = Order.save_cart(customer, shopping_cart)
    shopping_cart['order_id'] = @order.id

    @payment = make_payment
    
    @result = Veritrans.charge(
      payment_type: "VTWEB",
      vtweb: {
        # enabled_payments: [:credit_card],
        credit_card_3d_secure: true
      },
      transaction_details: {
        order_id: @payment.order_id,
        gross_amount: @payment.amount
      }
    )
    redirect_to @result.redirect_url and return
    # redirect_to pages_cart_url and return
  end
  

  def notification    
    @order.status_code = params[:status_code]
    @order.status_message = params[:status_message]
    case params[:status_code]
    when '200'
      @order.payment_type = params[:payment_type]
      @order.transaction_id = params[:transaction_id]
      @order.transaction_time = params[:transaction_time]
      @order.transaction_status = params[:transaction_status]
      @order.fraud_status = params[:fraud_status]
      @order.approval_code = params[:approval_code]
      @order.masked_card = params[:masked_card]
      @order.veritrans_order_id = params[:order_id]
      @order.bank = params[:bank]
      @order.status_id = Order.paid
      @order.save
      CustomerMailer.payment_received(@order).deliver_now
      AdminMailer.notify_support(@order, "Paid order waiting for work").deliver_now
      render json: {success: 'Thank you'}.to_json and return true
    else
      render json: {error: 'We are sorry, your order was not successfully charged'}.to_json and return false
    end
  end
  
  def success
    @order.status_id = Order.paid
    @order.save
    clear_cart_session
    flash[:success] = "Thank you for your support by purchasing our bracelet of Hope bracelet"
    redirect_to pages_bracelet_url(anchor: 'items', lang: 'en') and return
  end

  def receive_webhook
    post_body = request.body.read

    Veritrans.file_logger.info("Callback for order: " +
      "#{params[:order_id]} #{params[:transaction_status]}\n" +
      post_body + "\n"
    )

    verified_data = Veritrans.status(params["transaction_id"])

    if verified_data.status_code != 404
      puts "--- Transaction callback ---"
      puts "Payment:        #{verified_data.data[:order_id]}"
      puts "Payment type:   #{verified_data.data[:payment_type]}"
      puts "Payment status: #{verified_data.data[:transaction_status]}"
      puts "Fraud status:   #{verified_data.data[:fraud_status]}" if verified_data.data[:fraud_status]
      puts "Payment amount: #{verified_data.data[:gross_amount]}"
      puts "--- Transaction callback ---"

      render text: "ok"
    else
      Veritrans.file_logger.info("Callback verification failed for order: " +
        "#{params[:order_id]} #{params[:transaction_status]}}\n" +
        verified_data.body + "\n"
      )

      render text: "ok", :status => :not_found
    end

  end

  private
  
    def make_payment
      @paymentKlass = Struct.new("Payment", :amount, :token_id, :order_id, :credit_card_secure) do
        extend ActiveModel::Naming
        include ActiveModel::Conversion

        def persisted?; false; end

        def self.name
          "Payment"
        end
      end

      @paymentKlass.new(@order.total, '', "hope-#{@order.id}-#{@order.customer_id}-#{Time.now.to_i}", false)
    end
    
    def validate_order_id
      order_id, customer_id = parse_customer_order
      @order = Order.where(id: order_id, customer_id: customer_id).first
      respond_to do |format|
        format.html { 
          flash[:error] = 'We are sorry, we cannot find your order at the moment'
          redirect_to pages_cart_url and return false
        }
        format.json { render json: {error: 'We are sorry, we cannot find your order at the moment' }.to_json and return false}
      end unless @order
      # render json: {error: 'We are sorry, we cannot find your order at the moment'}.to_json and return false unless @order
    end
    
    def parse_customer_order
      order_id_params = params[:order_id].split('-')
      order_id = order_id_params[1]
      customer_id = order_id_params[2]
      [order_id, customer_id]
    end
    
    def validate_cart
      if shopping_cart['items'].blank?
        flash[:error] = 'Your shopping cart is empty'
        render 'pages/cart', :layout => 'pages' and return false
      end
      params['cart'].each do |cart_item|
        shopping_cart['items'].each_with_index do |item, index|
          next unless item['name'] == cart_item['name']
          session['cart']['items'][index]['quantity'] = cart_item['quantity']
        end
      end
    end
    
    def validate_shipping
      if !(shipping_params = params[:shipping]).blank?
        session['cart']['shipping']['full_name'] = shipping_params[:full_name]
        session['cart']['shipping']['address'] = shipping_params[:address]
        session['cart']['shipping']['detail'] = shipping_params[:detail]
        session['cart']['shipping']['phone'] = shipping_params[:phone]
        session['cart']['shipping']['location'] = shipping_params[:location]

        unless shipping_params[:full_name].blank? || 
                shipping_params[:address].blank? ||
                shipping_params[:detail].blank? ||
                shipping_params[:phone].blank? ||
                shipping_params[:location].blank?
          return true
        end
      end
      
      flash[:error] = 'Please complete your shipping address'
      render 'pages/cart', :layout => 'pages' and return false
    end
    
    def validate_product
      shopping_cart['items'].each do |cart_item|
        product = Product.where(name: cart_item['name']).first
        next unless (product.quantity.to_i < cart_item['quantity'].to_i) || (cart_item['quantity'].to_i > 20)
        @errors ||= {}
        @errors[product.name] ||= []
        @errors[product.name] << "cannot be more than 20 bracelets" if (cart_item['quantity'].to_i > 20)
        @errors[product.name] << "#{product.quantity} quantity left" if (product.quantity.to_i < cart_item['quantity'].to_i)
      end
      unless @errors.blank?
        flash[:error] = 'Please reduce the number of items in your cart'
        render 'pages/cart', :layout => 'pages' and return false
      end
    end
    
    def clear_cart_session
      session[:cart] = nil
      initialize_cart
    end
end