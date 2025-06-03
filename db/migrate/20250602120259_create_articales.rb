class CreateArticales < ActiveRecord::Migration[8.0]
  def change
    create_table :articales do |t|
      t.string :title
      t.string :body
      t.integer :report_number

      t.timestamps
    end
  end
end
