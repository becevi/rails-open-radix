class ArticlesController < ApplicationController
  def index

    @search_articles = ApiArticleFetcher.execute(params[:query].split(','))
      @all_articles = []
      # create article objects and saved them to DB and displayed in the index
    @search_articles.each do |article|
      @all_articles << Article.create(params:[]) # add params from newsapi
    end

  end



  # Add a button to saved_articles controller
end
