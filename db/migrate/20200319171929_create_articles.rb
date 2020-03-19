class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :url
      t.string :title
      t.integer :source_id
      t.string :author
      t.string :image
      t.datetime :published_at
      t.text :description
      t.integer :bookmark_count, :default => 0

      t.timestamps
    end
  end
end
