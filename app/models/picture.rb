class Picture < ActiveRecord::Base
	belongs_to :event
	mount_uploader :file, PictureUploader
end