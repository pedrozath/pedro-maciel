module ApplicationHelper
	def logged_in
		 session[:password] == ENV["PASSWORD"]
	end

	def rich_text_area(attribute)
		content_tag :div, nil, class: "rich-text-area", data:{field:attribute}, contenteditable: true
	end
end
