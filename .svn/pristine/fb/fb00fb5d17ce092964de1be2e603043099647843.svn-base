class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id

  validates :content, presence: true
  belongs_to :user
  belongs_to :post

  default_scope{ order('created_at DESC') }
end
