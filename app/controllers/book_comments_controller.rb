class BookCommentsController < ApplicationController
	def create
	    @book = Book.find(params[:book_id])
	    @book_new = Book.new
	    @comment = @book.book_comments.new(book_comment_params)
	    @comment.user_id = current_user.id

	    #@comment = BookComment.new(book_comment_params)
	    #@comment.book_id = @book.id
	    #@comment.user_id = current_user.id
	    if
	    @comment.save
	    redirect_to book_path(@book)
		# else
		# 	redirect_to book_path
		end
	end

	def destroy
    # BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    # redirect_to book_path(params[:book_id])

    @comment = BookComment.find(params[:id])
    book = @comment.book
    @comment.destroy
    redirect_to book_path(book)
	end

	private
	def book_comment_params
	    params.require(:book_comment).permit(:comment)
	end
end
