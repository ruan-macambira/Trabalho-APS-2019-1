class ArticleProofreader < ApplicationRecord
  belongs_to :article
  belongs_to :professor
end
