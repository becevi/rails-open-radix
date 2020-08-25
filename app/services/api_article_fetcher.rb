require 'news-api'
require 'open-uri'
require 'json'
# This service returns articles
class ApiArticleFetcher
  include Executable
  def initialize
    @api_key = "3222ed90cb3844f68f39c38c28927850"
    # need to set api_key through ENV though
    @news_api = News.new(@api_key)
  end
  def execute
    fetch_articles
  end
  private
  def fetch_articles
    @news_api.get_everything(
      q: 'bitcoin',
      sources: 'bbc-news,the-verge',
      domains: 'bbc.co.uk,techcrunch.com',
      from: '2020-08-01',
      to: '2020-08-12',
      language: 'en',
      sortBy: 'relevancy',
      page: 1
    )
  end
end
