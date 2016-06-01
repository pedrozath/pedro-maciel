# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick
    include CarrierWave::MimeTypes

    storage :fog

    def store_dir
        "images/#{model.id}"
    end

    def default_url(*args)
        ""
    end

    version :medium do
        process resize_to_fit: [648, nil]
    end

    version :cover do
        process resize_to_fill: [312, 180]
    end
end
