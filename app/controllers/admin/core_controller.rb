class Admin::CoreController < AdminController

	before_action :set_admin_calendar, only: [:index]

	def index
	end
	
end
