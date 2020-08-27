class AddUrlToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :article_url, :string
  end
end
