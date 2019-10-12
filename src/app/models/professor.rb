# frozen_string_literal: true

class Professor < User
  belongs_to :field
  has_and_belongs_to_many :articles
  has_and_belongs_to_many :events

  before_validation { self.role = :professor unless admin? }

  validates :registration, absence: true

  scope :search_by_field, lambda { |fields|
    if fields.nil?
      all
    else
      where field: fields
    end
  }
end
