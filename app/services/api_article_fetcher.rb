require 'open-uri'
require 'json'
require 'news-api'


require 'date'
# This service returns articles
class ApiArticleFetcher
  include Executable

  def initialize(query)
    @query = query
  end

  def execute
    fetch_articles
  end


  private

  def connect_to_api

  end

  def fetch_articles
    @newsapi = News.new("0d80da2ec0f6419cba14320e47c559cb") 
    if @query == ""
      @newsapi.get_everything(
        qInTitle: "trump",
        language: 'en',
        sortBy: 'publishedAt',
        pageSize: 10)
    else
      @newsapi.get_everything(
        qInTitle: @query,
        language: 'en',
        sortBy: 'publishedAt',
        pageSize: 100)
    end
  end
end
