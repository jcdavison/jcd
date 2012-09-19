class ArticlesController < ApplicationController
    
    def index
        @article= Article.all
    end

    def show
        @article = Article.find(params[:id])
    end
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(params[:article])
        @article.user_id = current_user.id
        @article.save
        redirect_to articles_path
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end   
end
