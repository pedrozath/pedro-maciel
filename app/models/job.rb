class Job
    include Mongoid::Document
    include Mongoid::Timestamps
    
    has_and_belong_to_many :tags
    embedded_in :clients

    field :name,        :string
    field :description, :string
    field :when,        :date
    field :brief,       :text
end
