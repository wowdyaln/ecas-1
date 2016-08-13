module CourseHelper
  #生成發表課程的預設日期
  def generate_default_date(date)
  	if date
  		date.to_date
  	else
  		Date.tomorrow
  	end
  end

  def render_reserve_btn(course)
  	if current_user
  		link_to("預約", reserve_course_path(course),method: "post", class: "btn-1")
  	else
  		content_tag(:span, "預約需登入", class: "btn-disable")
  	end
  end

  def render_cancel_reserve_btn(course)
  	if current_user
  		link_to("取消預約", cancel_reserve_course_path(course),method: "post", class: "btn-cancel")
  	else
  		content_tag(:span, "預約需登入", class: "btn-disable")
  	end
  end

end
