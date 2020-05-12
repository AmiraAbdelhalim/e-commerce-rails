
ActiveAdmin.register Product do

  permit_params :title, :description, :price, :in_stock, :category_id, :brand_id,:admin_user_id, images: []
  
  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs do
      f.input :category_id, as: :select, collection: Category.all
      f.input :brand_id, as: :select, collection: Brand.all
      # f.input current_admin_user.admin_user_id
      f.input :admin_user_id, as: :select, collection: AdminUser.where(is_seller: true)
      f.input :title
      f.input :description
      f.input :price
      f.input :in_stock
      f.input :images, as: :file,input_html: {multiple: true}
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
# controller do
#   def create

#     render plain: params[:product].inspect
#     # @product=Product.new(permit_params.merge(user_id:current_user.id))
#   #   @product=Product.new(permitted_params.merge(user_id:current_user.id))

#   #   if @product.save
#   #           redirect_to @product
#   #       else
#   #           render 'new'
#   #       end
#   end
# end
  # show page
  show do
    countImg=0;
    attributes_table  do 
      
      row :title
      row :description
      row :price
      row :in_stock
      row :category_id
      row :brand_id
      row 'NumberOfImage' do |ad| 
        countImg=ad.images.length
      end   
        (0...countImg).each do |img|      
        row :images do |ad|
          image_tag (url_for (ad.images[img])),width:150,height:150
        end
      end
    end
    active_admin_comments
  end
end
