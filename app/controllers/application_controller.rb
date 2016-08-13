class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

protected

	def configure_permitted_parameters
	 devise_parameter_sanitizer.for(:sign_in)        << :name
	 devise_parameter_sanitizer.for(:sign_up)        << :name
	 devise_parameter_sanitizer.for(:account_update) << :name
	end

private
	def set_admin_calendar
		@calendar_type = "admin"
		@date = params["date"] ? params["date"].to_date : Date.current
		courses = Course.find_courses(@date)
		@calendar = Calendar.generate_calendar(@date, courses)
	end

	def set_user_calendar
		@calendar_type = "user"
		@date = params["date"] ? params["date"].to_date : Date.current
		reserved_courses = current_user.courses.find_courses(@date)
		courses = Course.find_courses(@date)
		@calendar = Calendar.generate_user_calendar(@date, courses, reserved_courses)
	end

	def set_basic_calendar
		@calendar_type = "basic"
		@date = params["date"] ? params["date"].to_date : Date.current
		courses = Course.find_courses(@date)
		@calendar = Calendar.generate_calendar(@date, courses)
	end

end
