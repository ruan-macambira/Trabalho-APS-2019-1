class ChangeEventSubmissionEndToSubmissionFinish < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :submission_end, :submission_finish
  end
end
