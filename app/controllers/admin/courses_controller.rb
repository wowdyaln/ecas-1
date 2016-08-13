class Admin::CoursesController < AdminController

	def index
		@courses = Course.order(date: :DESC)
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.create(course_params)
		if @course.save

			flash[:success] = "success~"

			redirect_to admin_index_path
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
    	flash[:success] = "已儲存修改"
      redirect_to course_path(@course)
    else
      render :edit
    end		
	end

	def destroy
    @course = Course.find(params[:id])

    if @course.destroy
      flash[:success] = "課程 - #{@course.title}，已被刪除"
      redirect_to admin_courses_path
    else
      render :index
    end		
	end


	private
		def course_params
			params.require(:course).permit(:title, :description, :date, :cost)			
		end
end
