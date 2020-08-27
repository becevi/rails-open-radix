class SavedArticlesController < ApplicationController

  def create
    @timeline = Timeline.find_by(topic: params[:saved_article][:timeline])
    @saved_article = SavedArticle.new(article_id: params[:saved_article][:article_id]) # creating a link between timeline  and article
    @saved_article.timeline = @timeline
     if @saved_article.save
      redirect_to timeline_path(@timeline)
    else
     #maybe an error message
     redirect_to root_path
    end
  end
end
