class Timeline < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :saved_articles, inverse_of: :timeline
  has_many :articles, through: :saved_articles
  accepts_nested_attributes_for :saved_articles
end
