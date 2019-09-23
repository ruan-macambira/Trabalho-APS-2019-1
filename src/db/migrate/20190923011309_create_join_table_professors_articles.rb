class CreateJoinTableProfessorsArticles < ActiveRecord::Migration[5.2]
  def change
    create_join_table :professors, :articles do |t|
      t.index [:professor_id, :article_id]
      t.index [:article_id, :professor_id]
    end
  end
end
