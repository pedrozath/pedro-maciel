class Image
    include Mongoid::Document
    include Mongoid::Timestamps

    mount_uploader :file, ImageUploader

    validates :file, presence: true
    belongs_to :imageable, polymorphic: true
end