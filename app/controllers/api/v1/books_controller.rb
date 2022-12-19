class Api::V1::BooksController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    bookS = Book.all
  end

  def show
    book = Book.find(params[:id])
  end

  def create
    book = Book.create(book_params)
  end

  def update
    book = Book.find(params[:id])
    book.update!(book_params)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy!
  end

  private

  def book_params
    params.require(:data).permit(:title, :author, :genre)
  end
end
