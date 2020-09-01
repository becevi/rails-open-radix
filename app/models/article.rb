class Article < ApplicationRecord
  has_many :saved_articles
  validates :article_url, uniqueness: true
  validates :title, uniqueness: true
end
