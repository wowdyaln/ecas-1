module CourseHelper
  #生成發表課程的預設日期
  def generate_default_date(date)
  	if date
  		date.to_date
  	else
  		Date.tomorrow
  	end		
  end	
end
