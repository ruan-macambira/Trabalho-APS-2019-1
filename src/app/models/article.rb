class Article < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :users
  has_one_attached :pdf

  accepts_nested_attributes_for :authors, reject_if: :all_blank, allow_destroy: true

  alias_attribute :sender, :user
  alias_attribute :proofreaders, :users

  enum status: %i[awaiting pending failed passed]

  def proofreader
    proofreaders.first
  end

  def proofreader=(val)
    if proofreaders.empty?
      proofreaders << val
    else
      proofreaders.first = val
    end
  end
end
