class CreateHealths < ActiveRecord::Migration
  def change
    create_table :healths do |t|
      t.string      :title
      t.text        :question
      t.text        :answer
      t.integer     :status_id
      t.integer     :customer_id
      t.datetime    :publish_at
      t.datetime    :retract_at
      t.timestamps  null: false
    end
  end
end
