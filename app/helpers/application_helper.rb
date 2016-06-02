module ApplicationHelper
    def table_for hash
        return if hash.nil?
        render partial: "layouts/table", locals: { table: hash.map{|k,v| { col_name: k, col_value: v } } }
    end
end
