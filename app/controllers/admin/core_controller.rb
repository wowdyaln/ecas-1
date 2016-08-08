class Admin::CoreController < AdminController

	def index
		@date = params["date"] ? params["date"].to_date : Date.current
		@calendar_rows = Calendar.generate_admin_calendar(@date)
	end
	
end
