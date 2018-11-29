class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :caption
      t.integer :upvotes
      t.string :media_url
      t.references :user

      t.timestamps null: false
    end
  end
end
