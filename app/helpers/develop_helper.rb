module DevelopHelper
	def g_title(course)
		if course.new_record?
		  string = SecureRandom.uuid.gsub(/-/, '').upcase[0, 8]
		  string
		end  
	end

	def g_string(course)
		if course.new_record?
		  s_array1 = ["定時吃飯", "趴著睡午覺不流口水", "拉出優雅好看的便便", "冬天洗冷水澡", "大聲唱國歌", "用衛生紙摺紙飛機", "打麻將詐賭",
		  				 "徒手殺人", "煮出好吃的泡麵", "貪污", "單手寫程式", "買票選總統", "用廚餘養小孩", "在百貨公司乞討", "十秒鐘洗手術",
		  				 "製作土制炸彈", "用越南文說髒話", "用筷子吃布丁", "買票小撇步", "詐領保險金", "溝通靈界的朋友", "對月亮怒吼",
		  				 "手搖杯疊罐頭塔", "公寓種大麻", "用中文自我介紹", "橄欖油炸牛排", "補抓神奇寶貝", "從1數到8", "欺負小學生",
		  				 "精準投胎術", "當個邊緣人", "零風險養小鬼", "模仿海綿寶寶"  ]
		  				 .shuffle
			s_array2 = ["快速學習，馬上精通", "全世界都在跟達賴喇嘛學習：", "我是如何靠兩招成為有錢人的 - ", "資訊爆炸時代，你最需要的兩種技能 - ",
									"掌握未來趨勢，你必須懂的兩件事：", "兩小時改變人生，立馬精通 - ", "學會這些，你也能當比爾蓋茲 ：",
								  "想離開舒適圈？ 我的孩子，你必須先學會", "他們不會告訴你的事，成功者必備技能 - ",
								  "臉書創辦人親自指導，面對面學習", "沒有成功者的特質，但你能擁有成功者的技能，報名學習"]
									.shuffle		  				 
		  "#{s_array2.shift}#{s_array1.shift}與#{s_array1.shift}"
		end  				 
	end

end
