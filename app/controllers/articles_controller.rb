require 'news-api'

class ArticlesController < ApplicationController

  def index
    newsapi = News.new("0d80da2ec0f6419cba14320e47c559cb")
    @all_articles = newsapi.get_everything(q: 'bitcoin',
      sources: 'bbc-news,the-verge',
      domains: 'bbc.co.uk,techcrunch.com',
      from: '2020-08-01',
      to: '2020-08-12',
      language: 'en',
      sortBy: 'relevancy',
      page: 1)
  end
end
