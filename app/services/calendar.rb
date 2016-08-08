class Calendar
	private_class_method :new

	def initialize(date)
		days = Time.days_in_month(date.month, date.year)
		@calendar_array = Array.new(days) { |i| {"day" => i + 1, "course" => false} }
		@courses = Course.find_courses(date)
		@date = date
	end

	class << self 

		#生成管理員的行事曆
		def generate_admin_calendar(date)
			c = new(date)
			c.build_calendar
			c.normalize
		end

		#生成用戶的行事曆
		def generate_user_calendar
			
		end

	end

	#將哪些日期有課程加進@calendar_array
	def build_calendar
		@courses.each do |course|
			day = course["date"].day
			course["day"] = day
			course["course"] = true
		  @calendar_array[day-1] = course
		end
		@calendar_array		  
	end

	#得到一個normalize的calendar array，自動依每月天數分成若干組，並使每組成員與禮拜天到禮拜六對應
	def normalize
		new_calendar = []
		first_day = @date.beginning_of_month
		first_day.wday.times { @calendar_array.unshift({"day" => nil, "course" => false}) } 
		@calendar_array	.each_slice(7) { |group| new_calendar << group }		
		new_calendar.last << {"day" => nil, "course" => false} until new_calendar.last.size == 7
		new_calendar
	end

end	