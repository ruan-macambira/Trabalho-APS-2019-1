class CreateArticleProofreaders < ActiveRecord::Migration[5.2]
  def change
    create_table :article_proofreaders do |t|
      t.references :article, foreign_key: true
      t.references :professor, foreign_key: true

      t.timestamps
    end
  end
end
