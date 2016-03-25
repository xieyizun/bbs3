class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :parent_id

      t.timestamps
    end
    add_index :relationships, :parent_id
  end
end
