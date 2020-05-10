class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  belongs_to :admin_user
  validates :title,presence: true
  # format: { with: /\A[a-zA-Z]+\z/,
  # message: "Product Title Should Be Letters and Not NULL" }
  validates :description,presence: true
  validates :price,presence: true
  validates :in_stock,presence: true

  # has_one_attached :image
  has_many_attached :images

  def user_email#render email insted of seller id(admin)
    admin_user.email
  end

  def category_name#render name instead of id
    category.name
  end

  def brand_name#render name instead of id
    brand.name
  end

  # def img#render name instead of id
  #   images.url
  # end
  
end
