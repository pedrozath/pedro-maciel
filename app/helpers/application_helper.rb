module ApplicationHelper
	def rich_text_area(attribute)
		content_tag :div, nil, class: "rich-text-area", data:{field:attribute}, contenteditable: true
	end

    def table_for hash
        return if hash.nil?
        render partial: "layouts/table", locals: { table: hash.map{|k,v| { col_name: k, col_value: v } } }
    end
end
