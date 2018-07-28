class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, confirmation: true
  has_secure_password
end
