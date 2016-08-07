class Course < ActiveRecord::Base

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :cost, presence: true
  validates :date, uniqueness: true

  has_many :course_users
  has_many :students, through: :course_users, source: :user


  def is_lesson_of?(user)
    students.include?(user)
  end


end
