class ProductsController < InheritedResources::Base

  private

    def product_params
      params.require(:product).permit(:title, :description, :price, :in_stock, :category_id, :brand_id, :user_id)
    end

end
