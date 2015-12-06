class AlterCustomerDetails < ActiveRecord::Migration
  def change
    rename_column :customers, :company, :city
  end
end
