class Area
    include Mongoid::Document
    include Slug
    has_and_belongs_to_many :areas
    field :name, type: String
    validates :name, uniqueness: true, presence: true
end