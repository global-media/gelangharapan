class ShippingFeesController < ApplicationController
  layout 'admin'

  before_filter :admin_authorize
  before_filter :validate_admin_permission

  def index
    @shipping_fees = ShippingFee.all.order(:city)
  end
  
  def new
    @shipping_fee = ShippingFee.new
  end
  
  def create
    @shipping_fee = ShippingFee.new(shipping_fee_params)
    if @shipping_fee.save
      flash[:success] = 'Shipping Fee Create success!'
      redirect_to edit_admin_store_shipping_fee_url(id: @shipping_fee.id) and return
    end
    @errors = @shipping_fee.errors
    flash[:error] = "We're sorry, we cannot create the Shipping Fee at the moment"
    render template: 'shipping_fees/new'
  end
  
  def edit
    @shipping_fee = ShippingFee.find(params[:id])
  end

  def update
    @shipping_fee = ShippingFee.find(params[:id])
    if @shipping_fee.update_attributes(shipping_fee_params)
      flash[:success] = 'Shipping Fee Update success!'
      redirect_to edit_admin_store_shipping_fee_url and return
    end
    @errors = @shipping_fee.errors
    flash[:error] = "We're sorry, we cannot update the Shipping Fee at the moment"
    render template: 'shipping_fees/edit'
  end
  
  def destroy
    ShippingFee.find(params[:id]).destroy
    redirect_to admin_store_shipping_fees_url
  end
  
  protected
    
    def shipping_fee_params
      params.require(:shipping_fee).permit!
    end
end
