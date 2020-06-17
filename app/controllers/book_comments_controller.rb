class BookCommentsController < ApplicationController
  before_action :correct_user, only: [:destroy]
	def correct_user
    comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    if current_user.id != comment.user_id
      redirect_back(fallback_location: root_path)
		end
  end


  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(comment_params)
    comment.book_id = book.id
    if comment.save
      redirect_back(fallback_location: root_path)
    else
      flash.now[:notice] = "Unacceptable"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
      BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
      redirect_back(fallback_location: root_path)
  end
  
  
  private

  def comment_params
    params.require(:book_comment).permit(:comment)
  end
end
