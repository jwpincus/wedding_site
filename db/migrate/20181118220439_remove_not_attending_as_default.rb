class RemoveNotAttendingAsDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:guests, :will_attend, nil)
  end
end
