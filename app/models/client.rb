class Client
    include Mongoid::Document
    include Slug
    has_and_belongs_to_many :areas
    field :name,        type: String
    field :description, type: String
    default_scope Proc.new { all.order_by name: :asc }
    has_many :jobs    
    validates :name, uniqueness: true, presence: true
end