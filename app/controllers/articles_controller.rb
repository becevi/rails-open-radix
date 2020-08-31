class ArticlesController < ApplicationController
  def index
    @user = current_user
    @saved_article = SavedArticle.new
    @timelines = Timeline.all
    @timeline = Timeline.new
    @index_timeline = []
    @all_articles = ApiArticleFetcher.execute(params[:query]).last(10).reverse.each do |article|
      new_article = Article.create(
        title: article.title,
        author: article.author,
        source: article.name,
        description: article.description,
        content: article.content,
        published_at: article.publishedAt,
        img_url: article.urlToImage,
        article_url: article.url
      )
      @index_timeline << new_article
    end
    return @index_timeline
  end
end
