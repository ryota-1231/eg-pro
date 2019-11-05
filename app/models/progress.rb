class Progress < ApplicationRecord
  belongs_to :user
  belongs_to :drill
  belongs_to :curriculum

  enum evaluation: { "よく理解できた！": 2, "理解できた": 1, "少しモヤモヤ...": 0 }
end
