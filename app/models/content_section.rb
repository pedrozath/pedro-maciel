class ContentSection
    include Mongoid::Document
    include Mongoid::Timestamps
    include ImageHandling

    def self.types
        [
            :image, 
            :video
        ]
    end

    validates :title, :description, presence: true

    embedded_in :job

    field :type,        type: Symbol
    field :url,         type: String
    field :title,       type: String
    field :description, type: String
end