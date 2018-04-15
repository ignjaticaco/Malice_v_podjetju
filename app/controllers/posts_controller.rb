class PostsController < ApplicationController
    before_action :authenticate_admin!, except: [:index]
    def index
        @posts = Post.all
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def new 
        @post = Post.new
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end
    
    def update
        @post = Post.find(params[:id])
        
        if(@post.update(post_params))
            redirect_to @post
        else
            render 'edit'
        end
    end
    
    def create
        @post = Post.new(post_params)
        @post.admin_id = current_admin.id
        
        if(@post.save)
            redirect_to @post
        else
            render 'new'
        end
    end
    
    def upvote
        @post = Post.find(params[:id])
        @post.upvote_from current_admin
        redirect_to @post
    end
    
    def downvote
        @post = Post.find(params[:id])
        @post.downvote_from current_admin
        redirect_to @post
    end
    
    private def post_params
        params.require(:post).permit(:body, :title, :date, :admin_id)
    end
end
