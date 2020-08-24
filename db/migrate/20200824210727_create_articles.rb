class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :source
      t.text :description
      t.text :content
      t.date :published_at
      t.string :img_url

      t.timestamps
    end
  end
end
