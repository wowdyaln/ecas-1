class ChangeCourseCostChipToCost < ActiveRecord::Migration
  def change
  	rename_column :courses, :cost_chip, :cost
  	rename_column :courses, :open_date, :date
  end
end
