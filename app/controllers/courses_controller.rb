class CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]



  def index
    @courses = Course.order(date: :DESC)
  end


  def show
    @course = Course.find(params[:id])
  end

#-----------------------------------------------------#

  def reserve
    @course = Course.find(params[:id])

    if !current_user.is_student_of?(@course)
      current_user.reserve!(@course)
      flash[:notice] = "你已經成功預約 #{@course.title} 了！"

    else
      flash[:warning] = "你有預約過此 course 了"
    end

    redirect_to account_index_path
  end

  def cancel_reserve
    @course = Course.find(params[:id])

    if current_user.is_student_of?(@course)
      current_user.cancel_reserve!(@course)
      flash[:warning] = "你已經取消預約 #{@course.title} 課程，後會有期~"
    else
      flash[:danger] = "你還沒有預約呢~"
    end

    redirect_to account_index_path
  end


  private

  def course_params
  params.require(:course).permit(:title, :description, :date, :cost)
  end


end
