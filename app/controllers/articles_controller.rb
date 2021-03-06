class ArticlesController < ApplicationController

  respond_to :html, :json
  before_filter :check_blog_owner_status, :only => [:new,:create,:edit,:update,:destroy,:remove_tag, :add_tags]

  def index
    @articles = Article.order("created_at DESC")
  end

  def show
    if params[:id]
      @article = Article.find(params[:id])
    elsif params[:title]
      # is this ripe for sql injection attack? 
      @article = Article.find_by_title(params[:title])
    end
    redirect_to root_path unless @article
  end

  def new
    @article = Article.new
    @article.tags.build
  end

  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id
    if @article.save
      @article.add_tags(params[:tag])
      redirect_to article_path(@article.id)
    else
      flash[:alert] = "article not saved"
      redirect_to :back
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @tag = Tag.new
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])
    redirect_to :back
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end   

  def check_blog_owner_status
    unless  user_signed_in? && current_user.email == "johncdavison@gmail.com"
      redirect_to articles_path
    end
  end

  def remove_tag
    @article = Article.find(params[:article_id])
    @tag = Tag.find(params[:tag_id])
    @article.tags.delete(@tag)

    render :json => {
      :tag_id => @tag.id
    }
  end

  def add_tags
    @article = Article.find(params[:article_id])
    @article.add_tags(params[:tags])
    render :json => {
      :tags => render_to_string( :partial => "layouts/tags", :locals => { :article => @article } )
    }
  end

end
