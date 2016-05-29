require 'active_support/concern'

module ImageHandling
    extend ActiveSupport::Concern
    included do
        attr_accessor :image_file
        embeds_one :image, as: :imageable
        before_save :upload_image

        def upload_image
            unless self.image_file.nil?
                self.create_image(file: self.image_file)
            end
        end
    end
end