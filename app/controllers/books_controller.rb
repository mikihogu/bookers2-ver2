class BooksController < ApplicationController
  # def new
  #   @book = Book.new
  # end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path, notice: "posted successfully"
    else
      redirect_to request.referer, notice: "Failed"
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
