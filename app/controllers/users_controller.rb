class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'User created successfully'
      redirect_to users_path
    else
      flash[:alert] = 'User not created'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
