class User < ApplicationRecord
  has_many :blogs
  has_many :favorites, dependent: :destroy
  has_secure_password
  before_validation { email.downcase! }

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: {maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: { minimum: 6 }

  mount_uploader :image, ImageUploader
end
