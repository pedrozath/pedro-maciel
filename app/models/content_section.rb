class ContentSection
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Orderable
    include ImageHandling
    orderable

    def self.types
        [
            :image, 
            :video,
            :youtube,
            :vimeo
        ]
    end

    default_scope -> { all.order(position: :asc) } 

    embedded_in :job

    field :type,        type: Symbol
    field :url,         type: String
    field :video_code,  type: String
    field :title,       type: String
    field :description, type: String

    def youtube_url
        "http://www.youtube.com/embed/#{self.video_code}"
    end

    def vimeo_url
        "http://player.vimeo.com/video/#{self.video_code}"
    end

end