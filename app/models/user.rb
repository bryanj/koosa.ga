class User < ApplicationRecord
  has_many :submissions

  def recent_submissions(limit = 20)
    self.submissions.order(id: :desc).includes(:problem).limit(limit)
  end

  def get_threshold_levels
    tier = Math.exp(self.tier / 194 - 1) / 500
    [0, tier * 4 / 5, tier, tier * 5 / 4].map do |x|
      (Math.log(1 + x * 5) * 1608).to_i
    end
  end
end
