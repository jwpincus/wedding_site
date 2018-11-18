class Guest < ApplicationRecord
  validates_presence_of :first_name
  validates_uniqueness_of :email
  has_many :guest_messages
  has_many :messages, through: :guest_messages
  belongs_to :primary_guest, class_name: 'Guest', optional: true
  has_many :plus_ones, class_name: 'Guest', :foreign_key => 'guest_id'
  accepts_nested_attributes_for :plus_ones
  enum will_attend: [:no, :reception_only, :attend_both]

  def name
    "#{first_name} #{last_name}"
  end

end
