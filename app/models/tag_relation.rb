class TagRelation < ActiveRecord::Base
  belongs_to :tag
  belongs_to :content, polymorphic: true
  
  belongs_to :product, -> { where("tag_relations.content_type = 'Product'") }, foreign_key: 'content_id'
end
