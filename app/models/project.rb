class Project < ActiveRecord::Base
	has_many :pictures
	has_many :movies
	has_many :tags
	validates :name, :description, :date, presence: true
end
