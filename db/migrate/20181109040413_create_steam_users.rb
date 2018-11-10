class CreateSteamUsers < ActiveRecord::Migration
  def change
    create_table :steam_users do |t|
      t.string :steamid
      t.string :username

      t.timestamps null: false
    end
  end
end
