class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to posts_path, :notice => "Your post has been saved"
        else
            # This line overrides the default rendering behavior, which
            # would have been to render the "create" view.
            render "new"
        end
    end

    def new
        @post = Post.new
        @category = Category.all
    end

    def edit
        @post = Post.find(params[:id])
    end

    def show
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update_attributes(post_params)
            redirect_to post_path, :notice => "Your post has been updated"
        else
            render "edit"
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path, :notice => "Your post has been deleted"
    end

    private
    def post_params
        params.require(:post).permit(:title, :category_id, :body)
    end
end
