class UsersController < ApplicationController
  def index
    from = [0, params[:from].to_i - 1].max
    @users = User.order(:rank).limit(100).offset(from)
  end

  def show
    @user = User.where(username: params[:username]).first
  end

  def login
  end

  def login_proc
    session[:username] = params[:username]
    redirect_to :root
  end
end
