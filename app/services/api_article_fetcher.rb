require 'news-api'
require 'open-uri'
require 'json'
require 'net/http'
require 'openssl'

require 'date'
# This service returns articles
class ApiArticleFetcher
  attr_accessor :page_number
  include Executable
  def initialize(query)
    @page_number = 1
    @url = URI("https://contextualwebsearch-websearch-v1.p.rapidapi.com/api/Search/NewsSearchAPI?fromPublishedDate=#{date_from}&toPublishedDate=#{date_to}&autoCorrect=false&pageNumber=#{@page_number}&pageSize=20&q=#{URI.encode(query)}&safeSearch=false")

    @news_api = Net::HTTP.new(@url.host, @url.port)
  end

  def execute
    fetch_articles
  end

  def update_page_number(data)
    total_count = data["totalCount"]
    @page_number = (total_count/20) - 50

  end

  private

  def date_from
    URI.encode("12/31/2019")
  end

  def date_to
    URI.encode(Date.today.strftime("%e/%m/%Y"))
  end


  def fetch_articles
    @news_api.use_ssl=true
    @news_api.verify_mode=OpenSSL::SSL::VERIFY_NONE

    request=Net::HTTP::Get.new(@url)
    request["x-rapidapi-host"] = 'contextualwebsearch-websearch-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = 'c4b431f290msh720f431322e0af3p184953jsn92e2e34c2783'
    
    response=@news_api.request(request)


    data = JSON.parse(response.read_body)
    update_page_number(data)
    @news_api = Net::HTTP.new(@url.host, @url.port)
    JSON.parse(@news_api.request(request).read_body)
  end

end
