class Product < ApplicationRecord
  has_many :orders
  has_many :comments

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

  def search_postgre_sql_non_case_sensnitive(search_term)
    where("name ilike ?", "%#{search_term}%")
  end

  def search_for_development_and_test_cases(search_term)
    where("name LIKE ?", "%#{search_term}%")
  end

  def self.order_last_before(params)
    find(params[:id]).comments.order("created_at DESC").paginate(:page => params[:page])
  end
end
