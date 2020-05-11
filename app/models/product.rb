class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  belongs_to :admin_user
  # validates :title,presence: true
  # # format: { with: /\A[a-zA-Z]+\z/,
  # # message: "Product Title Should Be Letters and Not NULL" }
  # validates :description,presence: true
  # validates :price,presence: true
  # validates :in_stock,presence: true

  # has_one_attached :image
  has_many_attached :images
  
end
