class BooksController < ApplicationController
  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "posted successfully"
      @book = Book.new
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
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Updated"
    else
      render :show, notice: "Failed"
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
end
