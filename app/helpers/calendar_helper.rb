module CalendarHelper
	def query_date(date, day)
		query_date = Date.new(date.year, date.month, day)
		{ date: query_date }
	end

	def render_calendar
		case @calendar_type
		when "admin"
			render 'calendar/admin_calendar'
		when "user"
			render 'calendar/user_calendar'
		when "basic"
			render 'calendar/basic_calendar'
		end	
	end

	def render_calendar
		case @calendar_type
		when "admin"
			render 'calendar/admin_calendar'
		when "user"
			render 'calendar/user_calendar'
		when "basic"
			render 'calendar/basic_calendar'
		end	
	end
end
