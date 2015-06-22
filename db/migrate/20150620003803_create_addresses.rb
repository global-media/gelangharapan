class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string      :street1
      t.string      :street2
      t.string      :city
      t.string      :region
      t.string      :postal_code
      t.string      :country
      t.timestamps  null: false
    end
  end
end
