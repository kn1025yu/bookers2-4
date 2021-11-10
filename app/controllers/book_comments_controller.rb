class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = params[:book_id]
		@book_comment.save
  end

  def destroy
    @book_comment = BookComment.find(params[:id])
		@book_comment.destroy
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
