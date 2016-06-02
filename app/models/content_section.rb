require 'open-uri'

class ContentSection
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Orderable
    include ImageHandling
    orderable

    def self.types
        [
            :image, 
            :gif,
            :video,
            :youtube,
            :vimeo,
            :speaker_deck,
            :github,
            :issu,
            :technologies
        ]
    end

    default_scope -> { all.order(position: :asc) } 

    embedded_in :job

    field :type,        type:  Symbol
    field :url,         type:  String
    field :video_code,  type:  String
    field :code,        type:  String
    field :title,       type:  String
    field :description, type:  String
    field :technologies, type: Array

    def github
        github_data = self.url.split("/")
        OpenStruct.new user: github_data[0], repo: github_data[1]
    end

    def youtube_url
        "http://www.youtube.com/embed/#{self.video_code}"
    end

    def vimeo_url
        "http://player.vimeo.com/video/#{self.video_code}"
    end

    def speakerdeck_presentation
        JSON.parse(open("https://speakerdeck.com/oembed.json?url=#{self.url}").read)["html"]
    end
end