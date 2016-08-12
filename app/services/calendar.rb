class Calendar
	private_class_method :new

	def initialize(date, courses, reserved_courses=nil)
		days = Time.days_in_month(date.month, date.year)
		@courses = courses
		@reserved_courses = reserved_courses
		@calendar_array = Array.new(days) { |i| {"day" => i + 1, "course" => false} }
		@date = date
		@calendar = []
	end

	class << self 

		#生成基本行事曆
		def generate_calendar(date, courses, reserved_courses=nil)
			c = new(date, courses, reserved_courses)
			c.add_courses
			c.normalize
		end

		#生成用戶的行事曆
		def generate_user_calendar(date, courses, reserved_courses=nil)
			c = new(date, courses, reserved_courses)
			c.add_courses
			c.add_reserved_courses
			c.normalize
		end

	end

	#將哪些日期有課程加進@calendar_array
	def add_courses
		@courses.each do |course|
			day = course["date"].day
			course["day"] = day
			course["course"] = true
		  @calendar_array[day-1] = course
		end
		@calendar_array		  
	end

	#將已預約課程加入@calendar_array
	def add_reserved_courses
		@reserved_courses.each  do |course|
			day = course["date"].day
			course["day"] = day
			course["course"] = true
			course["state"] = "reserved"
		  @calendar_array[day-1] = course
		end
		@calendar_array  
	end

	#得到一個normalize的calendar array，自動依每月天數分成若干組，並使每組成員與禮拜天到禮拜六對應
	def normalize
		first_day = @date.beginning_of_month
		first_day.wday.times { @calendar_array.unshift({"day" => nil, "course" => false}) } 
		@calendar_array	.each_slice(7) { |group| @calendar << group }		
		@calendar.last << {"day" => nil, "course" => false} until @calendar.last.size == 7
		@calendar
	end



end	