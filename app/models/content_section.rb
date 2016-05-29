class ContentSection
    include Mongoid::Document
    include Mongoid::Timestamps
    has_one :image, as: :imageable

    attr_accessor :image_file

    def self.types
        [:image, :video]
    end

    validates :title, :description, presence: true
    before_validation :upload_image,  if: "type = :image"
    # validates :image, presence: true, if: "type = :image"

    embedded_in :job

    field :type,        type: Symbol
    field :url,         type: String
    field :title,       type: String
    field :description, type: String

    def upload_image
        unless image.nil?
            self.create_image file: image_file
        end
    end
end