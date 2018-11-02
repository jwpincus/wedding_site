class Message < ApplicationRecord
  validates_presence_of :body, :subject
  
  has_many :guest_messages
  has_many :guests, through: :guest_messages
end
