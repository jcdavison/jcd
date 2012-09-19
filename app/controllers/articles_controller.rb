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
        audit current_user.id
        @article.save
        redirect_to articles_path
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        @article.update_attributes(params[:article])
        redirect_to articles_path
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end   
end
