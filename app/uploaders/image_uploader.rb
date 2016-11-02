# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :dropbox
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    #"public/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Heroku has a read-only filesystem, so uploads must be stored on S3 and cannot be cached in the public directory.
  # You can work around this by setting the cache_dir in your Uploader classes to the tmp directory:
  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  version :thumb do
    process :resize_to_fit => [263, 263]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end


