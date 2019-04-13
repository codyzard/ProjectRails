class CommentsController < ApplicationController

   
    def index
        @comment = Comment.all
    end

    def new
        user = session[:user_id]
        @comment = Comment.new(book_id: params[:book_id])
        @book = Book.find(params[:book_id])
    end

    def create
        
        @comment = Comment.new(comment_params)
        @comment.user_id = session[:user_id]
        @book  = Book.find(@comment.book_id)
        # @comment.book_id = params[:book_id]
        
        if @comment.save
            
            flash[:notice] = "comment created"
            redirect_to @book
        else
            flash[:danger] = "Error, something has happened"
            redirect_to @book   
        end
    end
    
    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find_by(params[:id])
        @comment.update_attributes(comment_params)
        @book  = Book.find(@comment.book_id)
        flash[:success] = "Comment updated"
        redirect_to @book
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        @book  = Book.find(@comment.book_id)
        redirect_to @book
    end
    
    private 

    def comment_params
      params.require(:comment).permit(:content, :user_id, :book_id)
    end

    
end


