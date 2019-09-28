class Event < ApplicationRecord
  belongs_to :field
  has_many :articles
  has_and_belongs_to_many :professors
  has_and_belongs_to_many :keywords

  scope :latest, ->(num) { order(:created_at, :desc).limit(num) }
end
