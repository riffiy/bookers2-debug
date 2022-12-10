class BookCommentsController < ApplicationController
  
  def create
    @book = Book.find(params[:book_id])
    @comment = BookComment.new(book_comment_params)
    @comment.book_id = @book.id
    @comment.user_id = current_user.id
    @comment.save
    @comment_new = BookComment.new
  end
  
  def destroy
    @book = Book.find(params[:book_id])
    @bookcomment = BookComment.find(params[:id]).destroy
    
  end
  
end

 private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
