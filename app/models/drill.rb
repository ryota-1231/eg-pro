class Drill < ApplicationRecord
  mount_uploader :image_1, ImageUploader
  mount_uploader :image_2, ImageUploader
  mount_uploader :image_3, ImageUploader
  belongs_to :user
  belongs_to :curriculum
  has_many :progresses
  has_ancestry

  validates :user_id, :curriculum_id, presence: true
  validates :title, length:  { maximum: 30 }
  validates :discription, length: { maximum: 250 }

  def drill_present
    unless self.title.blank? || self.discription.blank?
      return true
    else
      return false
    end

  end

end
