class CreateJwtBlacklist < ActiveRecord::Migration
  def change
    create_table :jwt_blacklists do |t|
      t.string :jti, null: false
    end
    add_index :jwt_blacklists, :jti
  end
end
