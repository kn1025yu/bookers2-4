class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if  @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user), notice:'successfully'
    else
    flash.now[:alert] = 'unsuccessfully'
    render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
