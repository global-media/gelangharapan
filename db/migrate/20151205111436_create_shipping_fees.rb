class CreateShippingFees < ActiveRecord::Migration
  def change
    create_table :shipping_fees do |t|
      t.string :city
      t.float :fee
      t.timestamps null: false
    end
  end
end
