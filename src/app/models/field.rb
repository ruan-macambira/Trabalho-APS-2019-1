class Field < ApplicationRecord
  has_many :professors
  has_many :events

  def self.all
    super.where.not(name: 'NOFIELD')
  end
end
