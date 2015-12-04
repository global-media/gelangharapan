module OrdersHelper
  def order_status_options
    Order::STATUSES.collect {|k,v| [v, k]}
  end
  
  def order_description(order)
    items = []
    order.items.each do |oi|
      items << "#{oi.product_name} (#{oi.quantity})"
    end
    raw(items.join(', '))
  end
end
