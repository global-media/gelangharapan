class ShippingFee < ActiveRecord::Base
  validates_presence_of :city, :fee
  validates_uniqueness_of :city
end
