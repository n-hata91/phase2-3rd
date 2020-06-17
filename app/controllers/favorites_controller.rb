class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favo = current_user.favorites.new(book_id: book.id)
    favo.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    favo = current_user.favorites.find_by(book_id: book.id)
    favo.destroy
    redirect_back(fallback_location: root_path)
  end
end
