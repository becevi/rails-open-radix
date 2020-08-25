require 'news-api'
require 'open-uri'
require 'json'

class NewsApiService

  def initialize
    @api_key = "3222ed90cb3844f68f39c38c28927850"
    # need to set api_key through ENV though
  end
  # all the business logic will go here
  # NewsApiServices.new.search will later be called in controllers
  def search
    newsapi = News.new("3222ed90cb3844f68f39c38c28927850")
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


def search
  url = 'https://newsapi.org/v2/everything?q=bitcoin&apiKey=3222ed90cb3844f68f39c38c28927850'
  @articles = JSON.parse(open(url).read)
  end
end
