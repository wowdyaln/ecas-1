class CoursesController < ApplicationController

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


  private

  def course_params
  params.require(:course).permit(:title, :description, :open_date, :cost_chip)
  end


end
