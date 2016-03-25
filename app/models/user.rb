class User < ActiveRecord::Base

  attr_accessible :email, :name, :password, :password_confirmation

  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :nullify

  before_save { self.email.downcase }
  before_save :create_remember_token

  validates_presence_of :name, message: '用户名不能为空'
  validates_uniqueness_of :name, message: '用户名已存在'
  validates_length_of :name, maximum: 60, message: '用户名最长为60'

  validates_presence_of :email, message: '邮箱不能为空'
  validates_uniqueness_of :email, case_sensitive: false, message: '邮箱已注册'
  validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: '邮箱格式错误'

  validates_presence_of :password, message: '密码不能为空'
  validates_presence_of :password_confirmation, message: '请再输入一次密码'
  validates_length_of :password, minimum: 6, message: '密码长度不能小于6'
  validates_confirmation_of :password, message: '两次输入密码不一致'

  private
      def create_remember_token
              self.remember_token = SecureRandom.urlsafe_base64
      end
end
