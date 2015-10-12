class Movie < ActiveRecord::Base
	belongs_to :project
	mount_uploader :file, MovieUploader
end
