class PictureUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def picture_url
    "/assets/" + [version_name, "default_post.png"].compact.join("_")
  end

  def default_url
    if model.class.name
      ActionController::Base.helpers.asset_path("fallback/" + [version_name,
        "news.jpg"].compact.join("_"))
    end
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
