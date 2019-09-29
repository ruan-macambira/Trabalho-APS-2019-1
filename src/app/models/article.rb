class Article < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :users
  has_one_attached :pdf

  alias_attribute :sender, :user
  alias_attribute :proofreaders, :users

  enum status: %i[awaiting pending failed passed]
end
