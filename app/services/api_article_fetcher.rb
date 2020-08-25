require 'news-api'
require 'open-uri'
require 'json'
require 'net/http'
require 'openssl'

require 'date'
# This service returns articles
class ApiArticleFetcher
  include Executable

  attr_accessor :page_number, :url

  def initialize(query)
    @query = query
    @page_number = 1
    @url = URI("#{base_uri}?fromPublishedDate=#{date_from}\
      &toPublishedDate=#{date_to}\
      &autoCorrect=false\
      &pageNumber=#{@page_number}\
      &pageSize=20\
      &q=#{URI.encode(@query)}\
      &safeSearch=false"
    )
  end

  def execute
    fetch_articles
  end

  def update_page_number(data)
    total_count = data["totalCount"]
    #! The totalCount is not for the news in DB is for the related articles
    #! 100 seems to work with most searches, play with it.
    @page_number = 1
  end

  private

  def base_uri
    'https://contextualwebsearch-websearch-v1.p.rapidapi.com/api/Search/NewsSearchAPI'
  end

  def dynamic_url
    URI("#{base_uri}?fromPublishedDate=#{date_from}&toPublishedDate=#{date_to}&autoCorrect=false&pageNumber=#{@page_number}&pageSize=20&q=#{URI.encode(@query)}&safeSearch=false")
  end

  def date_from
    URI.encode("12/31/2019")
  end

  def date_to
    URI.encode(Date.today.strftime("%e/%m/%Y"))
  end

  def connect_to_api
    news_api = Net::HTTP.new(dynamic_url.host, dynamic_url.port)
    news_api.use_ssl = true
    news_api.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(dynamic_url)
    request["x-rapidapi-host"] = 'contextualwebsearch-websearch-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = 'c4b431f290msh720f431322e0af3p184953jsn92e2e34c2783'

    news_api.request(request)
  end

  def fetch_articles
    update_page_number(JSON.parse(connect_to_api.read_body))
    @page_number -= 2 while JSON.parse(connect_to_api.read_body)['value'].empty?
    JSON.parse(connect_to_api.read_body)['value']
  end
end
