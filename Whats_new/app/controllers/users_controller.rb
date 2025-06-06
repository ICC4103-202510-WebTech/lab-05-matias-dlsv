class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "User created successfully"
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
  
end
