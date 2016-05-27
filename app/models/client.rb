class Client
    include Mongoid::Document
    include Slug
    has_and_belongs_to_many :areas
    field :name,        type: String
    field :description, type: String
    has_many :jobs    
    validates :name, uniqueness: true, presence: true
end
