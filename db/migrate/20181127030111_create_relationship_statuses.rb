class CreateRelationshipStatuses < ActiveRecord::Migration
  def change
    create_table :relationship_statuses do |t|
      t.string :status

      t.timestamps null: false
    end
  end
end
