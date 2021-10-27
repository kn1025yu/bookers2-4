class UsersController < ApplicationController

  def index
    @user = User.all
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @books = Book.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
