module CalendarHelper
	def query_date(date, cell)
		{ date: {year: date.year, month: date.month, day: cell["day"]} }
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
