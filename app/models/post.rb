class Post < ActiveRecord::Base
  accessible_attributes :content

  before_save :create_remember_token

  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 200}

  has_many :comments, dependent: :destroy

  default_scope { order('created_at DESC') }

  private
    def create_remember_token
      self.remember_token2 = SecureRandom.urlsafe_base64
    end
end
