class AddStatusIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :status_id, :bigint
  end
end
