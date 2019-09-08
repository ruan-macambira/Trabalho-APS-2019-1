class Field < ApplicationRecord
  has_many :events
  has_many :professors
end
