class Professor < ApplicationRecord
  belongs_to :field
  has_many :article_proofreaders
  has_many :event_proofreaders
  has_many :articles, through: :article_proofreaders
  has_many :events, through: :event_proofreaders
end
