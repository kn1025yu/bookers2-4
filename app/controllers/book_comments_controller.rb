class BookCommentsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    comment = current_user.book_comments.new(post_comment_params)
    comment.user_id = user.id
    comment.save
    redirect_to user_path(user)
  end

  def destroy
    BookComment.find_by(params[:user_id]).destroy
    redirect_to user_path(params[:user_id])
  end

  private

  def post_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
