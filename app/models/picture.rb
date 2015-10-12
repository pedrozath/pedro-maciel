class Picture < ActiveRecord::Base
	belongs_to :event
	belongs_to :project
	mount_uploader :file, PictureUploader
end