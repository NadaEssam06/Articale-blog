class AddImageToArticles < ActiveRecord::Migration[8.0]
  def change
    add_column :articales, :image, :string
  end
end
