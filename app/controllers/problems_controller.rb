class ProblemsController < ApplicationController
  def index
    @count = Array.new(100){[0, 0]}
    solved = Set.new Submission.where(user_id: session[:user_id]).distinct.pluck(:problem_id)
    Problem.all.each do |p|
      @count[p.level / 100][1] += 1
      @count[p.level / 100][0] += 1 if solved.include? p.id
    end
  end

  def show
    @level = params[:level].to_i
    solved = Set.new Submission.where(user_id: session[:user_id]).distinct.pluck(:problem_id)
    problems = Problem.where(["level >= ? and level < ?", @level * 100, (@level + 1) * 100])
    @solved = problems.select{|p| solved.include? p.id}
    @unsolved = problems.reject{|p| solved.include? p.id}
  end
end
