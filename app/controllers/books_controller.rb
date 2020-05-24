class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @booknew = Book.new
    @user = current_user
  	@books = Book.all
  end

  def create
  	@booknew = Book.new(book_params)
  	@booknew.user_id = current_user.id
  	if @booknew.save
    flash[:notice]="You have creatad book successfully."
  	redirect_to book_path(@booknew.id)
    else
      @user = current_user
      @books = Book.all
      render 'index'
    end
  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user.id
    redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    #  @book.user_id == current_user.id
      if@book.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@book.id)
    else render :edit
    end

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
