class Notification < ApplicationRecord
  belongs_to :article
  belongs_to :user
  validates_uniqueness_of :status, scope: :article

  def message
    I18n.t(
      status,
      scope: ['message', 'article', role],
      article: article.title,
      event: article.event.name
    )
  end
end
