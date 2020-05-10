module ProductsHelper
    def product_author(product)
        user_signed_in? && current_user.id == product.admin_user_id
      end
end
