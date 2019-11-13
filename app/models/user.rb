class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable, :omniauthable, omniauth_providers: [:twitter]

  has_many :drills
  has_many :curriculums, through: :drills
  has_many :progresses
  has_one_attached :avatar

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        image: auth.info.image,
        name: auth.info.name,
        nickname: auth.info.nickname,
        location: auth.info.location
      )
    end
    user
  end
 
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


  private
 
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
  
end
