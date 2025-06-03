class AddDefaultCountAndUserToArticles < ActiveRecord::Migration[8.0]
  def change
    change_column_default :articales, :report_number, 0 
    add_reference :articales, :users, null: false, foreign_key: true
  end
end
