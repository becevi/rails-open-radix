class SavedArticlesController < ApplicationController

  def create
    raise
    @timeline = Timeline.where(topic: params[:timeline])
    @saved_article = SavedArticle.new(params[:article_id]) # creating a link between timeline  and article
    @saved_article.timeline = @timeline
    raise
     if @saved_article.save
      redirect_to timeline_path(@timeline)
    else
     #maybe an error message
     redirect_to root_path
    end
  end
end
