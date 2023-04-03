class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: "posted successfully"
    else
      redirect_to request.referer
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.new
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def book_params
    params.permit(book).require(:title, :opinion)
  end
end
