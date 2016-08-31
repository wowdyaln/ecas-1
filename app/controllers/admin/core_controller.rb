class Admin::CoreController < AdminController

	before_action :set_admin_calendar, only: [:index]

	def index
	end


	def list
		@users = User.all.nochip  #列出點數為0 的 user
	end

end
