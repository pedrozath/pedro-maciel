class Image
    include Mongoid::Document
    include Mongoid::Timestamps

    mount_uploader :file, ImageUploader
    embedded_in :imageable, polymorphic: true
end