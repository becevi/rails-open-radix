class SavedArticlesController < ApplicationController

  def create
    @timeline = Timeline.find_by(topic: params[:saved_article][:timeline])
    @saved_article = SavedArticle.new(article_id: params[:saved_article][:article_id])
    @saved_article.timeline = @timeline
     if @saved_article.save
      redirect_to timeline_path(@timeline)
    else
     #maybe an error message
     redirect_to root_path
    end
  end

  def destroy
    @saved_article = SavedArticle.find(params[:id])
    @timeline = @saved_article.timeline
    @saved_article.destroy
    redirect_to timeline_path(@timeline)
  end
end
