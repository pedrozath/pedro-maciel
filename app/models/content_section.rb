class ContentSection
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Orderable
    include ImageHandling
    orderable

    def self.types
        [
            :image, 
            :video
        ]
    end

    default_scope -> { all.order(position: :asc) } 

    embedded_in :job

    field :type,        type: Symbol
    field :url,         type: String
    field :title,       type: String
    field :description, type: String

end