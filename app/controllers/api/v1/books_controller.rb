class Api::V1::BooksController < ApplicationController
  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def metro_params
    params.require(:data).permit(:title, :author, :description)
  end
end
