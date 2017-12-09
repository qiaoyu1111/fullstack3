class Course < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true

  belongs_to :user
  has_many :posts
end
