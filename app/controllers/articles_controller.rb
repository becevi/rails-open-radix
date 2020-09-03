class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @user = current_user
    @saved_article = SavedArticle.new
    @timelines = Timeline.where(user: current_user)
    @timeline = Timeline.new
    @index_timeline = []
    @all_articles = ApiArticleFetcher.execute(params[:query]).last(12).reverse.each do |article|
      new_article = Article.find_by(published_at: article.publishedAt)
      new_article = Article.create!(
        title: article.title,
        author: article.author,
        source: article.name,
        description: article.description,
        content: article.content,
        published_at: article.publishedAt,
        img_url: article.urlToImage,
        article_url: article.url
      ) if not new_article
      @index_timeline << new_article
    end
    return @index_timeline.uniq!
  end
end
