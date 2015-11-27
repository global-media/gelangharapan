class Order < ActiveRecord::Base
  has_many :order_items
  alias :items :order_items

  belongs_to :customer
  belongs_to :shipping_address, class_name: 'Address'
  belongs_to :billing_address, class_name: 'Address'
  
  STATUSES = {1 => 'Open',
              2 => 'Processed',
              3 => 'Cancelled'}.freeze

  attr_accessor :freeze_discount
  
  def status; STATUSES[status_id];  end
  
  def open!;    update_attribute(:status_id, Order.status_id?('Open'));  end
  def cancel!;  update_attribute(:status_id, Order.status_id?('Cancelled'));  end
  def process!; update_attribute(:status_id, Order.status_id?('Processed'));  end
  
  def opened?;      status_id == Order.status_id?('Open');      end
  def cancelled?;   status_id == Order.status_id?('Cancelled');    end
  def processed?;   status_id == Order.status_id?('Processed'); end
  
  class << self
    def open!(order_id);      Order.find(order_id).open!;     end
    def cancel!(order_id);    Order.find(order_id).cancel!;   end
    def process!(order_id);   Order.find(order_id).process!;  end

    def status_id?(status_name)
      STATUSES.detect {|k,v| v == status_name}.first || 1
    end
    
    def open;             Order.status_id?('Open');             end
    def processed;        Order.status_id?('Processed');        end
    def cancelled;        Order.status_id?('Cancelled');        end
    
    def save_cart(customer, cart)
      order = if cart['order_id']
                Order.find(cart['order_id'])
              else
                Order.new(status_id: Order.open)
              end
      order.customer = Customer.find(customer['id'])
      order.subtotal = 0
      order.total = 0
      order.order_items.destroy_all
      cart['items'].each do |cart_item|
        total_price = cart_item['quantity'].to_i * cart_item['value'].to_i
        oi = OrderItem.create(sold_price: total_price, original_price: cart_item['value'], quantity: cart_item['quantity'], product_name: cart_item['name'])
        order.items << oi
        order.subtotal += total_price
      end
      order.calculate!
      order
    end
  end
  
  def update_items(order_items)
    self.order_items = []
    order_items.each do |k, v|
      order_item = OrderItem.find(k)
      order_item.update_attributes(v)
      self.order_items << order_item
    end
    save
  end
  
  def calculate!
    self.total = subtotal 
    self.total -= discount if discount
    self.total += tax if tax
    self.total += shipping if shipping
    save!
  end
end
