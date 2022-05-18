class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update, :edit]

  def index
    redirect_to new_user_registration_path
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
        redirect_to(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
    end
    redirect_to user_path(current_user)
  end

  private

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to(current_user)
    end
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
