class AddChipToUser < ActiveRecord::Migration
  def change
    add_column :users, :chip, :integer
  end
end
