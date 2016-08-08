class Course < ActiveRecord::Base

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :cost, presence: true
  validates :date, uniqueness: true

  has_many :course_users
  has_many :students, through: :course_users, source: :user

  scope :courses_in_this_month, -> (date) {where(date: (date.beginning_of_month)..date.end_of_month)}


  def is_lesson_of?(user)
    students.include?(user)
  end

  class << self

    def find_courses(date)
      courses = self.courses_in_this_month(date)
      courses.as_json
    end

  end


end
