class EventProofreader < ApplicationRecord
  belongs_to :event
  belongs_to :professor
end
