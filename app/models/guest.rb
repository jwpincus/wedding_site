class Guest < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :email
  has_many :plus_ones  
  has_many :guest_messages
  has_many :messages, through: :guest_messages
end
