class CreateGuestMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :guest_messages do |t|
      t.references :guest, foreign_key: true
      t.references :message, foreign_key: true

      t.timestamps
    end
  end
end
