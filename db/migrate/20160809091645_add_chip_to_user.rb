class AddChipToUser < ActiveRecord::Migration
  def change
    add_column :users, :chip, :integer, default: 0
  end
end
