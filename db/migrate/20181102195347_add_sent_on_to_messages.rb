class AddSentOnToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :sent_on, :date
  end
end
