class Professor < User
  belongs_to :field
  has_and_belongs_to_many :articles
  has_and_belongs_to_many :events
end