class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string      :title
      t.text      :post
      t.integer     :status_id
      t.integer     :customer_id
      t.integer     :sort
      t.datetime    :publish_at
      t.datetime    :retract_at
      t.timestamps  null: false
    end
  end
end
