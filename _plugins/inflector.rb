require 'active_support/inflector'

module RailsFilters
  def parameterize(input)
    ActiveSupport::Inflector.parameterize("#{input}")
  end
end

Liquid::Template.register_filter(RailsFilters)