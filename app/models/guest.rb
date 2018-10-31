class Guest < ApplicationRecord
  validates_presence_of :name, :email
  validates_uniqueness_of :email
  has_many :plus_ones  
end
