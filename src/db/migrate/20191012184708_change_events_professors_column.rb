class ChangeEventsProfessorsColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :events_users, :user_id, :professor_id
  end
end
