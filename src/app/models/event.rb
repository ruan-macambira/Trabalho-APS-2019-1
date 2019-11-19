class Event < ApplicationRecord
  belongs_to :field
  has_many :articles
  has_many :users, through: :articles
  has_and_belongs_to_many :professors
  has_and_belongs_to_many :keywords

  scope :latest, ->(num) { order(created_at: :desc).limit(num) }

  def status
    if Date.today < submission_start
      :awaiting
    elsif (submission_start..submission_finish).include?(Date.today)
      :opened
    else
      :closed
    end
  end

  def self.status(status, date = Date.today)
    case status.to_sym
    when :awaiting
      where('SUBMISSION_START > ?', date)
    when :opened
      where('SUBMISSION_START <= :date AND SUBMISSION_FINISH >= :date', {date: date})
    when :closed
      where('SUBMISSION_FINISH < :date', {date: date})
    end
  end

  def awaiting?
    status == :awaiting
  end

  def opened?
    status == :opened
  end

  def closed?
    status == :closed
  end

  def self.ransackable_scopes(_auth_object = nil)
    %i[status]
  end
end
