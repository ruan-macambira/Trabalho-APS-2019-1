class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :initials
      t.date :event_start
      t.date :event_end
      t.date :submission_start
      t.date :submission_end
      t.references :field, foreign_key: true

      t.timestamps
    end
  end
end
