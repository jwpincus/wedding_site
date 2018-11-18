class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :will_attend, default: 0
      t.boolean :will_camp
      t.text :dietary_restrictions
      t.string :song

      t.timestamps
    end
  end
end
