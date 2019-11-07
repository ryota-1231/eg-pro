class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :drills
  has_many :curriculums, through: :drills
  has_many :progresses
  has_one_attached :avatar

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def thumbnail
    return self.avatar.variant(combine_options: {
      resize: "80x80^",
      gravity: "center",
      crop: "80x80+0+0",
    })
  end

  def thumbnail_50
    return self.avatar.variant(combine_options: {
      resize: "50x50^",
      gravity: "center",
      crop: "50x50+0+0",
    })
  end

  def progresses_count
    children = []
    links = []
    self.progresses.each do |progress|
      links << progress.curriculum_id
    end

    num = links.uniq
    num.each do |n|
      children << Curriculum.find(n)
    end

    return num
  end
  
end
