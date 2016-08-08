module CourseHelper
  #生成發表課程的預設日期
  def generate_date(hash)
  	if hash
  		Time.new(hash[:year], hash[:month], hash[:day]).to_date
  	else
  		Date.tomorrow
  	end		
  end	
end
