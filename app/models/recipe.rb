class Recipe < ApplicationRecord
  has_one_attached :image

  belongs_to :customer
  has_many :comments
end
