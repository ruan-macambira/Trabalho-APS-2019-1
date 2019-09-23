class CreateJoinTableEventProfessors < ActiveRecord::Migration[5.2]
  def change
    create_join_table :events, :professors do |t|
      t.index [:event_id, :professor_id]
      t.index [:professor_id, :event_id]
    end
  end
end
