class Tag
    include Mongoid::Document
    has_and_belongs_to_many :jobs
    field :name, type: String
    validates :name, uniqueness: true, presence: true

    def self.clean_up
        for tag in self.all
            tag.destroy unless tag.jobs.size > 0
        end
    end
end