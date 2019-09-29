class Event < ApplicationRecord
  belongs_to :field
  has_many :articles
  has_and_belongs_to_many :professors
  has_and_belongs_to_many :keywords

  scope :latest, ->(num) { order(created_at: :desc).limit(num) }

  def self.search(**params)
    keywords = Keyword.where(id: params[:keywords])
    if params
      where('name LIKE ?', "%#{params[:name]}%")
        .where('initials LIKE ?', "%#{params[:initials]}%")
        .where(keywords: keywords)
    else
      all
    end
  end

  def status
    if Date.today < submission_start
      :awaiting
    elsif (submission_start..submission_finish).include?(Date.today)
      :opened
    else
      :closed
    end
  end
end
