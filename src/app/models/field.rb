class Field < ApplicationRecord
  has_many :professors
  has_many :events
end
