class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book1 = Book.new
    @book_comment = BookComment.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice:'successfully'
    else
      @books = Book.all
      render :index
      flash.now[:alert] = 'unsuccessfully'
    end
  end

  def edit
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    if @book.update(book_params)
    redirect_to book_path(@book), notice:'successfully'
    else
    @books = Book.all
    flash.now[:alert] = 'unsuccessfully'
    render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

private
  def book_params
   params.require(:book).permit(:title, :body)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
  end

end
