class Guest < ApplicationRecord
  validates_presence_of :first_name
  has_many :guest_messages
  has_many :messages, through: :guest_messages
  belongs_to :primary_guest, class_name: 'Guest', optional: true, foreign_key: 'guest_id'
  has_many :plus_ones, class_name: 'Guest', :foreign_key => 'guest_id'
  accepts_nested_attributes_for :plus_ones
  enum will_attend: ['not attending', 'saturday reception only', 'attend friday and saturday']

  def name
    "#{first_name} #{last_name}"
  end

end
