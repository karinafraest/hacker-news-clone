class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.authenticate(params[:user][:username], params[:user][:hashed_password])
    if !@user.nil?
      session[:user_id] = @user.id
      redirect_to articles_path
    else
      render 'new'
    end
  end

end
