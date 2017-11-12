require 'active_support/inflector'

module Jekyll
  module RailsFilters
    def parameterize(input)
      ActiveSupport::Inflector.parameterize(input)
    end
  end
end

Liquid::Template.register_filter(Jekyll::RailsFilters)