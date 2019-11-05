class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :drills
  has_many :curriculums, through: :drills
  has_many :progresses
  has_one_attached :avatar

  def thumbnail
    return self.avatar.variant(combine_options: {
      resize: "80x80^",
      gravity: "center",
      crop: "80x80+0+0",
    })
  end
  
end
