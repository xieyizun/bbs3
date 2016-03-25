class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id

  validates :content, presence: true
  belongs_to :user
  belongs_to :post

  has_one :relationship, foreign_key: 'child_id', dependent: :destroy
  has_one :parent, through: :relationship

  default_scope{ order('created_at DESC') }
end
