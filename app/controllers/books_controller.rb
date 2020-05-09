class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new

  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book successfully created"
      redirect_to user_path(current_user.id)
    else
      flash[:notice] = "error, Something went wrong"
      redirect_to user_path(current_user.id)
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
