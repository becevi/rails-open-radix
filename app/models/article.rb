class Article < ApplicationRecord
  has_many :saved_articles
  validates :published_at, uniqueness: true
end
