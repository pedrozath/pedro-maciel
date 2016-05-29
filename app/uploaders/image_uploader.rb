# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
    storage :fog

    def store_dir
        "images/#{model.id}-#{DateTime.now.to_s.parameterize}"
    end

    def default_url(*args)
        ""
    end
end
