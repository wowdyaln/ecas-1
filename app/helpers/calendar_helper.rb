module CalendarHelper
	def query_date(date, cell)
		{ date: {year: date.year, month: date.month, day: cell["day"]} }
	end
end
