class AddNotNullToStatusArticle < ActiveRecord::Migration[5.2]
  def change
    change_column_null :articles, :status, false, 0
    change_column_default :articles, :status, from: nil, to: 0
  end
end
