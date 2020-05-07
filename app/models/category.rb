class Category < ApplicationRecord
    validates :name,format: { with: /\A[a-zA-Z]+\z/,
    message: "Category Name Should Be Letters and Not NULL" }
    has_many :product
end
