class AddPrimaryGuestToGuest < ActiveRecord::Migration[5.1]
  def change
    add_reference :guests, :guest, foreign_key: true
  end
end
