class CreateSavedArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_articles do |t|
      t.string :comment
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
