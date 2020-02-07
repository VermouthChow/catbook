class BooksController < ApplicationController
  
  def index
    @books = ::Book.includes(:words).order(updated_at: :DESC).page(params[:page] || 1)
  end
end
