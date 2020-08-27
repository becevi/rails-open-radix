class AddTimelineIdToSavedArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :saved_articles, :timeline, foreign_key: true
  end
end
