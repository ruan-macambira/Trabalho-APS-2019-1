class ChangeFieldsFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :read, :boolean
    change_table(:notifications) do |t|
      t.string :status
      t.references :article
      t.rename :message, :offset
      t.string :role, nullable: false, default: 'user'
    end
    change_column_null :notifications, :offset, false
  end
end
