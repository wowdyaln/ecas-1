class Account::UserController < ApplicationController

	before_action :set_user_calendar, only: [:index]

	def index

	end

end
