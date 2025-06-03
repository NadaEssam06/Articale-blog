class AddPublishedColumnToArticles < ActiveRecord::Migration[8.0]
  def change
    add_column :articales, :published, :boolean
  end
end
