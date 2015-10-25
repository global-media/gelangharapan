class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string      :name
      t.string      :link_url
      t.attachment  :image
      t.attachment  :video
      t.integer     :sort
      t.datetime    :publish_at
      t.datetime    :retract_at
      t.timestamps  null: false
    end
  end
end
