class Course < ApplicationRecord
  mount_uploader :image, ImageUploader
end
