class Articale < ApplicationRecord
  belongs_to:user
  mount_uploader :image, ImageUploader
  def published?
    published == true
  end
  def archived?
    report_number == 3
  end

end
