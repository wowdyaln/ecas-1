class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  has_many :course_users
  has_many :courses, through: :course_users

  def is_student_of?(course)
    courses.include?(course)
  end


  def reserve!(course)
    courses << course
  end

  def cancel_reserve!(course)
    courses.delete(course)
  end

#選擇點數為0 的 user
  scope :nochip, -> {where("chip = 0")}





end
