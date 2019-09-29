class AddDefaultToFieldUser < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :field_id, from: nil, to: 1
  end
end
