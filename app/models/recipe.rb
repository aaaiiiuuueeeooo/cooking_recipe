class Recipe < ApplicationRecord
  has_one_attached :image

  belongs_to :customer

end
