class CreateFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :followers do |t|
      t.integer :boss_id
      t.integer :subordinate_id

      t.timestamps
    end
    add_index :followers, :boss_id
    add_index :followers, :subordinate_id
    add_index :followers, [:boss_id, :subordinate_id], unique: true
  end
end
