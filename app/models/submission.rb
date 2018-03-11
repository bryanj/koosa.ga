class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :problem

  def submitted_in_words
    diff = (Time.now - created_at).to_i
    if diff < 60
      "방금 전"
    elsif diff < 3600
      "#{diff / 60}분 전"
    elsif diff < 259200
      "#{diff / 3600}시간 전"
    else
      "#{diff / 86400}일 전"
    end
  end
end
