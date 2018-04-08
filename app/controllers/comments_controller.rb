class CommentsController < ApplicationController
before_action :authenticate_admin!, except: [:index]
    
    def new
        @comment = current_admin.comments.build
    end
    
    def create
        @comment = current_admin.comments.build(comment_params)
        @post = Post.find(params[:post_id])
        @comment.post_id = @post.id
        @comment.save
        redirect_to post_path(@post)
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end
    
    private def comment_params
        params.require(:comment).permit(:body, :post_id, :admin_id)
    end
end
