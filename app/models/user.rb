class User < ApplicationRecord
  has_many :submissions

  def recent_submissions(limit = 20)
    self.submissions.order(id: :desc).includes(:problem).limit(limit)
  end
end
