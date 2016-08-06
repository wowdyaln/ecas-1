class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  has_many :course_users
  has_many :lessons, through: :course_users, source: :course

  def is_student_of?(course)
    lessons.include?(course)
  end


  def reserve!(course)
    lessons << course
  end

  def cancel_reserve!(course)
    lessons.delete(course)
  end




end
