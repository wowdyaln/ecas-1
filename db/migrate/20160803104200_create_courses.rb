class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.date :open_date
      t.integer :cost_chip


      t.timestamps null: false
    end
  end
end
