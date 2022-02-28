class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy] 
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  # GET /articles
  # GET /articles.json
  def index
       @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    
  end


  def new
    @article = Article.new
  end


  def create
    @article= Article.new(article_params)
    @article.user= current_user
    if @article.save
      flash[:notice] = "Article has saved sucessfully"
      redirect_to article_path(@article)
    else
      render new_article_path
    end   
  end


  def edit
  end


  def update
    if @article.update(article_params)
      flash[:notice] = "Article updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end


  def destroy
    @article.destroy
    redirect_to articles_path
  end



  private

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end 

  def set_article
    @article=Article.find(params[:id])
  end

  def require_same_user
    if @article.user != current_user && !current_user.admin?
      flash[:alert] = "You can edit or delete articles created by you"
      redirect_to @article
    end
  end
 
end
