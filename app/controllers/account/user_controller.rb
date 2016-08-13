class Account::UserController < ApplicationController

	before_action :set_user_calendar, only: [:index]

	def index

	end


	def purchase
	end

	def buy_chip
		current_user.chip += params[:chip].to_i
		current_user.save
		flash[:notice] = "你已經成功購買 #{params[:chip]} 點了！"
		redirect_to account_index_path
	end

	def courses_list
		@courses = current_user.courses.order(date: :DESC)
	end

end
