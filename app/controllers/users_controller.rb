class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @events = Event.all
  end

  def guest_view
    @user = User.find(params[:current_id])
    @view_target = User.find(params[:user_id])
    @events = Event.all
    render :guest
  end

  def unfriend
    @user1 = User.find(params[:id])
    @user2 = User.find(params[:user_id])

    # Remove from each other's friend
    @user1.friends.delete(@user2)
    @user2.friends.delete(@user1)

    redirect_to current_user
  end

  def view_requests
    @user = User.find(params[:id])
    render :requests
  end

  def friends
    @user = User.find(params[:id])
    render :friends
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.friends
    if @user.save
      # Sign user in to its session
      session[:user_id] = @user.id
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)

      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    # Reset the sesion
    reset_session
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end
