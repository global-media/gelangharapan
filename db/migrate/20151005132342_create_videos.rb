class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string      :name
      t.string      :location
      t.text        :article_id
      t.text        :article_en
      t.string      :image_url
      t.string      :link_url
      t.integer     :sort
      t.datetime    :publish_at
      t.datetime    :retract_at
      t.attachment  :image
      t.timestamps  null: false
    end
  end
end
