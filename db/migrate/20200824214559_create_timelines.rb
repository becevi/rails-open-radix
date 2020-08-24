class CreateTimelines < ActiveRecord::Migration[6.0]
  def change
    create_table :timelines do |t|
      t.string :topic
      t.text :description
      t.date :date_opened
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
