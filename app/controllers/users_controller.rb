class UsersController < ApplicationController
  def index
    from = [0, params[:from].to_i - 1].max
    @users = User.order(:rank).limit(100).offset(from)
  end

  def show
    @user = User.where(username: params[:username]).first
    render action: :error if @user.nil?
  end

  def login
  end

  def login_proc
    user = User.where(username: params[:username]).first
    if user
      session[:username] = params[:username]
      session[:user_id] = user.id
      redirect_to :root
    else
      render action: :error
    end
  end
end
