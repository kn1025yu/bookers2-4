class BooksController < ApplicationController
  def index
    @book = Book.all
    book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path(@book.id)
    else
      render :index
    end
    
  end

  def show
  end

  def destory
  end

  private

  def post_image_params
    params.require(:book).permit(:title, :body)
  end

end
