class SavedArticlesController < ApplicationController

  def create
    @saved_article = SavedArticle.new(param[:article, :timeline]) # creating a link between timeline  and article

     if @saved_article.save
      redirect_to timeline_path
    else
     #maybe an error message
  end

end
