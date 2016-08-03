class Course < ActiveRecord::Base

  validates :title, presence: true
  validates :description, presence: true
  validates :open_date, presence: true
  validates :cost_chip, presence: true

end
