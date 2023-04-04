class BooksController < ApplicationController
  before_action :ensure_current_user, only: [:edit, :update]

  def create
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "Posted successfully"
      # @book = Book.new
    else
      render :index
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
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path, notice: "Deleted"
    else
      render :show ,notice: "Failed"
    end
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
  
  def ensure_current_user
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
  end
  
end
