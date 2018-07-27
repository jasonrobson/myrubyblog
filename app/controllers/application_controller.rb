class ApplicationController < ActionController::Base
    helper_method :all_categories, :all_posts
    before_action :site_search

    def site_search
        @results = []
        if params[:search] && params[:search] != ''
            @results = Post.where('title LIKE ? OR body LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
        end
    end
    def all_categories
        @categories = Category.all
    end
    def all_posts
        @posts = Post.all
    end
end
