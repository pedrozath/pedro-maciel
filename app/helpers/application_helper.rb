module ApplicationHelper
	def rich_text_area(attribute)
		content_tag :div, nil, class: "rich-text-area", data:{field:attribute}, contenteditable: true
	end
end
