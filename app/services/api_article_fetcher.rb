require 'open-uri'
require 'json'


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
   url= "https://content.guardianapis.com/search?order-by=oldest&page-Size=10&q=#{URI.encode(q)}&api-key=a56dd13e-d0f2-40f4-992d-8cad04244c0d"
   puts url
   articles_serialized = open(url).read
   @articles = JSON.parse(articles_serialized)
  end

  def q
    query_arr = @query.map do |query|
      "\"#{query}\""
    end

    query_arr.join(" AND ")


  end


end
