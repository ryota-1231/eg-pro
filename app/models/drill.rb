class Drill < ApplicationRecord
  belongs_to :user
  has_many :images
  has_ancestry
end
