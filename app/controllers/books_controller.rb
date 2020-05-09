class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def show
    @new = Book.new
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end
  
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book successfully created"
      redirect_to user_path(current_user.id)
    else
      flash[:notice] = "error, Something went wrong"
      @books = Book.all
      render :index
    end
  end

def edit
  @book = Book.find(params[:id])
end

def update
  @book = Book.find(params[:id])
  @book.update(book_params)
  flash[:notice] = "Book was successfully updated"
  redirect_to book_path(@book)
end

def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path
end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
