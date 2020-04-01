class ArticlesController < ApplicationController

  # list, show, create, update and destroy an article, like we did for the task manager
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.create(article_params)
    redirect_to article_path(article.id)
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article.id)
  end

  def destroy
    @article.delete
    redirect_to root_path
  end

    private

  def set_article
    @article = Article.find(params[:id].to_i)
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
