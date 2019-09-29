class Professor < User
  belongs_to :field
  has_and_belongs_to_many :articles
  has_and_belongs_to_many :events

  before_validation { self.role = :professor unless admin? }

  validates :registration, absence: true
end
