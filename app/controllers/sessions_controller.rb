class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.authenticate(params[:user][:username], params[:user][:hashed_password])
    if !@user.nil?
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_path
  end

end
