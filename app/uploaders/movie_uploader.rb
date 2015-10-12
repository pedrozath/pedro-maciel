# encoding: utf-8

class MovieUploader < CarrierWave::Uploader::Base
    storage :fog

	# def move_to_cache
	#     true
	# end

	def move_to_store
		true
	end

    def store_dir
        "movies/#{model.id}"
    end



end
