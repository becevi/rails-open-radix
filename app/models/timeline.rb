class Timeline < ApplicationRecord
  belongs_to :user
  has_many :saved_articles, inverse_of: :timeline, dependent: :destroy
  has_many :articles, through: :saved_articles
  accepts_nested_attributes_for :saved_articles
end
