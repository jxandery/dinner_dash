class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "Invalid fields"
      render :new
    end
  end

  def show
  end

  def cart
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

end
