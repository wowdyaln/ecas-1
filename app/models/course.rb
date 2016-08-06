class Course < ActiveRecord::Base

  validates :title, presence: true
  validates :description, presence: true
  validates :open_date, presence: true
  validates :cost_chip, presence: true

  has_many :course_users
  has_many :students, through: :course_users, source: :user


  def is_lesson_of?(user)
    students.include?(user)
  end


end
