class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:name])
    redirect_to login_path if @user.nil?
    if !@user.nil? && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to @user
    end
  end

  def new
    render :new
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
