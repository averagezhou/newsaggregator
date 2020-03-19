class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order({ :created_at => :desc })

    render({ :template => "articles/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @article = Article.where({:id => the_id }).at(0)

    render({ :template => "articles/show.html.erb" })
  end

  def create
    @article = Article.new
    @article.url = params.fetch("query_url")
    @article.title = params.fetch("query_title")
    @article.source_id = params.fetch("query_source_id")
    @article.author = params.fetch("query_author")
    @article.image = params.fetch("query_image")
    @article.published_at = params.fetch("query_published_at")
    @article.description = params.fetch("query_description")
    @article.bookmark_count = params.fetch("query_bookmark_count")

    if @article.valid?
      @article.save
      redirect_to("/articles", { :notice => "Article created successfully." })
    else
      redirect_to("/articles", { :notice => "Article failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @article = Article.where({ :id => the_id }).at(0)

    @article.url = params.fetch("query_url")
    @article.title = params.fetch("query_title")
    @article.source_id = params.fetch("query_source_id")
    @article.author = params.fetch("query_author")
    @article.image = params.fetch("query_image")
    @article.published_at = params.fetch("query_published_at")
    @article.description = params.fetch("query_description")
    @article.bookmark_count = params.fetch("query_bookmark_count")

    if @article.valid?
      @article.save
      redirect_to("/articles/#{@article.id}", { :notice => "Article updated successfully."} )
    else
      redirect_to("/articles/#{@article.id}", { :alert => "Article failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @article = Article.where({ :id => the_id }).at(0)

    @article.destroy

    redirect_to("/articles", { :notice => "Article deleted successfully."} )
  end
end
