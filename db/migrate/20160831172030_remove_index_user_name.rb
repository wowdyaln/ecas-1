class RemoveIndexUserName < ActiveRecord::Migration
  def change
  	remove_index :users, name: 'index_users_on_name'
  end
end
