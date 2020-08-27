class ArticlesController < ApplicationController
  def index
    @index_timeline = []
    @all_articles = ApiArticleFetcher.execute(params[:query]).last(5).each do |article|
      new_article = Article.create(
        title: article.title,
        author: article.author,
        source: article.name,
        description: article.description,
        content: article.content,
        published_at: article.publishedAt,
        img_url: article.urlToImage
      )
      @index_timeline << new_article
    end
    return @index_timeline
  end
end
