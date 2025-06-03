class Articale < ApplicationRecord
  belongs_to:user
  mount_uploader :image, ImageUploader
  def published?
    published == true
  end

end
