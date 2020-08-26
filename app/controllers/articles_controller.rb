class ArticlesController < ApplicationController
  def index
    @all_articles = ApiArticleFetcher.execute(params[:query].split(','))
  end
end
