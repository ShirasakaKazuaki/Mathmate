class User < ApplicationRecord
  before_save { self.email = email.downcase }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :uimg, UimgUploader

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :stocks, dependent: :destroy
  has_many :stocked_posts, through: :stocks, source: :post

  def already_liked?(post)
    likes.exists?(post_id: post.id)
  end

  def already_stocked?(post)
    stocks.exists?(post_id: post.id)
  end

  has_many :responses, dependent: :destroy
  has_many :replies, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)(?=.*?\W)[!-~]+\z/i.freeze

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6, maximum: 12 }, format: { with: VALID_PASSWORD_REGEX, message: 'は英数字記号を1つずつ使用してください。' }
  validates :profile, length: { maximum: 200 }
end
