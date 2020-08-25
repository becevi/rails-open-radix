class ArticlesController < ApplicationController
  def index
    @all_articles = ApiArticleFetcher.execute
  end
end
