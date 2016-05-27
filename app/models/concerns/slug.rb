require 'active_support/concern'

module Slug
    extend ActiveSupport::Concern
    included do
        field :slug,  type: String
        before_save   :create_slug
        before_update :create_slug
        def create_slug
            self.slug = name.parameterize
        end
    end

    def to_param
        slug
    end
end