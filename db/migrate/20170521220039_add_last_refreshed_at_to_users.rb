class AddLastRefreshedAtToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_refreshed_at, :date
  end
end
