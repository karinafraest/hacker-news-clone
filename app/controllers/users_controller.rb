class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(username: params[:user][:username])
    @user.password= params[:user][:hashed_password]
    if @user.save
      redirect_to new_sessions_path
    else
      render 'new'
    end
  end

end
