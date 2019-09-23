class CreateJoinTableEventKeywords < ActiveRecord::Migration[5.2]
  def change
    create_join_table :events, :keywords do |t|
      t.index [:event_id, :keyword_id]
      t.index [:keyword_id, :event_id]
    end
  end
end
