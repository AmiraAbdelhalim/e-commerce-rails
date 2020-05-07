class Brand < ApplicationRecord
    validates :name,format: { with: /\A[a-zA-Z]+\z/,
    message: "Brand Name Should Be Letters and Not NULL" }
    has_many :product
end
