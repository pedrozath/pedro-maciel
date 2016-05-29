class Job
    include Mongoid::Document
    include Mongoid::Timestamps
    include Slug
    include ImageHandling

    has_and_belongs_to_many :tags
    belongs_to :client
    embeds_many :content_sections

    field :name,  type: String
    field :when,  type: Date
    field :brief, type: String

    attr_accessor :other_tags, :tag_list

    before_save :save_tags
    after_destroy :clean_tags

    validates :name, :when, :brief, presence: true

    def clean_tags
        Tag.clean_up
    end

    def areas
        client.areas
    end

    def tag_ids_strings
        tag_ids.collect(&:to_s)
    end

    def year
        self.when.year
    end

    def save_tags
        unless self.tag_list.nil?
            for tag_id in tag_list
                tags << Tag.find(tag_id)
            end
        end

        unless self.other_tags.nil?
            for tag_name in other_tags.split(", ") || []
                tags << Tag.create(name: tag_name)
            end
        end
    end

    def cover
        begin
            self.image.file.url
        rescue
            ""
        end
    end

end
