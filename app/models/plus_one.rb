class PlusOne < ApplicationRecord
  belongs_to :guest
  validates_presence_of :name
end
