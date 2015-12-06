module ShippingFeesHelper
  def shipping_fee_options
    [['Select City', '']] + ShippingFee.all.order(:city).collect {|c| ["#{c.city} - #{money_value(c.fee)}", c.city]}
  end
end
