class Drill < ApplicationRecord
  mount_uploader :image_1, ImageUploader
  mount_uploader :image_2, ImageUploader
  mount_uploader :image_3, ImageUploader
  belongs_to :user
  belongs_to :curriculum
  has_many :progresses
  has_ancestry

end
