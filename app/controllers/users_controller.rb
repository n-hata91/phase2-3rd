class UsersController < ApplicationController
  def home
  end

  def index
    @users = User.all
    @book = Book.new
  end
  

  def show
    @books = Book.where(user_id: params[:id])
    @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User info was successfully updated"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "error, something went wrong"
      redirect_to edit_user_path(@user.id)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end