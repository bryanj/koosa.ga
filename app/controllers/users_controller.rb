class UsersController < ApplicationController
  def login
  end

  def login_proc
    session[:username] = params[:username]
    redirect_to :root
  end
end
