class BooksController < ApplicationController
  def index
    @books = Book.all.order(author: :asc)
  end

  def edit
    @book = Book.find(params[:id])
  end
end
