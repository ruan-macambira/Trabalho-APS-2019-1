class EventKeyword < ApplicationRecord
  belongs_to :event
  belongs_to :keyword
end
