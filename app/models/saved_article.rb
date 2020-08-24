class SavedArticle < ApplicationRecord
  belongs_to :article
  belongs_to :timeline
end
