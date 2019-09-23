class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :institution, :string
    add_column :users, :registration, :string
    add_column :users, :title, :string
    add_reference :users, :field, foreign_key: true
  end
end
