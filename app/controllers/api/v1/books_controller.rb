class Api::V1::BooksController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    books = Book.all
    render json: books.map(&:to_json_api)
  end

  def show
    book = Book.find(params[:id])
    render json: book.to_json_api
  end

  def create
    book = Book.create(book_params)
    render json: book.to_json_api
  end

  def update
    book = Book.find(params[:id])
    book.update!(book_params)
    render json: book.to_json_api
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy!
    return head :no_content
  end

  private

  def book_params
    params.require(:data).permit(:title, :author, :genre)
  end
end
