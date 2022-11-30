class Recipe < ApplicationRecord
  has_one_attached :image

  belongs_to :customer
  has_many :comments

  has_many :bookmarks, dependent: :destroy
  has_many :recipe_tags,dependent: :destroy
  has_many :tags,through: :recipe_tags,dependent: :destroy, source: :tag

  def bookmarked_by?(customer)
    bookmarks.where(customer_id: customer).exists?
  end
end
