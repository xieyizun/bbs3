class Relationship < ActiveRecord::Base
  attr_accessible :parent_id, :child_id

  belongs_to :parent, class_name: 'Comment'
  belongs_to :child, class_name: 'Comment'
end
