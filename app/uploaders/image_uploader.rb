# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
    storage :fog

    def store_dir
        "images/#{model.id}"
    end

    def default_url(*args)
        ""
    end

    version :cover do
        process resize_to_fill: [312, 180]
    end
end
