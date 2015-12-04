class AddShippingColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :full_name, :string
    add_column :orders, :phone, :string
  end
end
