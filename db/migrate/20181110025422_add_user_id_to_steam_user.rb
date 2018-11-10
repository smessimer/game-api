class AddUserIdToSteamUser < ActiveRecord::Migration
  def change
    add_column :steam_users, :user_id, :integer
  end
end
