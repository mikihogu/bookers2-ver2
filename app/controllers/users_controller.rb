class UsersController < ApplicationController
  before_action :ensure_current_user, only: [:edit, :update]

  def new

  end

  def create

  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Updated"
    else
      render :show, notice: "Failed"
    end
  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:name, :instoduction, :profile_image)
  end

  def ensure_current_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to books_path
    end
  end
end
