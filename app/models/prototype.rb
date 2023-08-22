class Prototype < ApplicationRecord
  belong_to :user
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
  belongs_to :user
  has_one_attached : image

end
