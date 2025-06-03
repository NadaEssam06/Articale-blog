class AddArchivedColumnToArticles < ActiveRecord::Migration[8.0]
  def change
    add_column :articales, :archived, :boolean

  end
end
