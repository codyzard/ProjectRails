class CommentsController < ApplicationController
  before_action :load_book, only: :create

  def index
    @q = Comment.ransack(params[:q]) 
   	@comments = @q.result.page(params[:page])
  end

  def new;
  end 

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = params[:book_id]
    # @book = Book.find(params[:book_id])
    # @comment = @book.comment.create(params[:comment]).permit(:user,:content )
    if @comment.save
      flash[:success] = "create_success"
      redirect_to book_path(@book)
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:user_id, :book_id, :content)
  end

  def load_book
    @book = Book.find_by(params[:id])
    return if @book
    flash[:danger] = "books.load_book.error_message"
    redirect_to root_path
  end
end
