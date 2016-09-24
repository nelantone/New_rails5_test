class Product < ApplicationRecord
  has_many :orders
  has_many :comments
  has_many :payments

  validates :name, presence: true
  validates :image_url, presence: true
  validates :price, presence: true

  def highest_rating_comment
    comments.rating_desc.first
  end

  def rest_of_comments
    comments.rating_desc.drop(1)
  end

  def average_rating
    comments.average(:rating).to_f
  end
end
