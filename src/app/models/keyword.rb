class Keyword < ApplicationRecord
  has_many :event_keywords
  has_many :events, through: :event_keywords
end
