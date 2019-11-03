class Curriculum < ApplicationRecord
  has_many :drills
  has_many :users, through: :drills
  has_ancestry
end
