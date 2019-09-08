class Event < ApplicationRecord
  belongs_to :field
  has_many :event_keywords
  has_many :event_proofreaders
  has_many :keywords, through: :event_keywords
  has_many :professors, through: :event_proofreaders
end
