class RenameUsersIdToUserIdInArticales < ActiveRecord::Migration[8.0]
  def change
    rename_column :articales, :users_id, :user_id
  end
end
