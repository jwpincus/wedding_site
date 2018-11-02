class GuestMessage < ApplicationRecord
  belongs_to :guest
  belongs_to :message
end
