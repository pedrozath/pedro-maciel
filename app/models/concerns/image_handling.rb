require 'active_support/concern'

module ImageHandling
    extend ActiveSupport::Concern
    included do
        attr_accessor :image_file
        embeds_one :image, as: :imageable
        after_save :upload_image

        def upload_image
            unless self.image_file.nil?
                image = Image.new file: self.image_file
                image.imageable = self
                image.save
            end
        end
    end
end