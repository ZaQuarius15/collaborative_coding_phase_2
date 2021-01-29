class RemoveIsHostFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :is_host, :boolean
  end
end
