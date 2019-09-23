class CreateJoinTableAuthorsArticles < ActiveRecord::Migration[5.2]
  def change
    create_join_table :authors, :articles do |t|
      t.index [:author_id, :article_id]
      t.index [:article_id, :author_id]
    end
  end
end
