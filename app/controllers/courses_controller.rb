class CoursesController < ApplicationController
  before_action :authenticate_user!



  def index
    @courses = Course.all
  end


  def show
    @course = Course.find(params[:id])
  end


  def new
    @course = Course.new
  end


  def create
    @course = Course.create(course_params)

    if @course.save
      redirect_to courses_path, notice: "新增課程成功！"
    else
      render :new
    end
  end


  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to course_path(@course), notice: "修改課程成功！"
    else
      render :edit
    end
  end


  def destroy
    @course = Course.find(params[:id])

    if @course.destroy
      redirect_to courses_path, alert: "此課程已經刪除！"
    else
      render :index
    end
  end

#-----------------------------------------------------#

  def reserve
    @course = Course.find(params[:id])

    if !current_user.is_student_of?(@course)
      current_user.reserve!(@course)
      flash[:notice] = "你已經成功預約 #{@course.title} 了！"

    else
      flash[:notice] = "你有預約過此 course 了"
    end

    redirect_to course_path(@course)
  end

  def cancel_reserve
    @course = Course.find(params[:id])

    if current_user.is_student_of?(@course)
      current_user.cancel_reserve!(@course)
      flash[:notice] = "你已經取消預約 #{@course.title} 課程，後回有期~"
    else
      flash[:notice] = "你還沒有預約呢~"
    end

    redirect_to course_path(@course)
  end


  private

  def course_params
  params.require(:course).permit(:title, :description, :open_date, :cost_chip)
  end


end
