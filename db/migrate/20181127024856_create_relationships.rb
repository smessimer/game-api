class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :user_1
      t.references :user_2
      t.references :activity_by_user
      t.references :relationship_status

      t.timestamps null: false
    end
  end
end
