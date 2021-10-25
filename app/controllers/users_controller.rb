class UsersController < ApplicationController
  
  def index
  end
  
  def show
    @books = Book.find(params[:id])
    @books = @user.boos.page(params[:page]).reverse_order
  end
  
end
