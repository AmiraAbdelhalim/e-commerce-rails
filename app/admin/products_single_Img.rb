ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :description, :price, :in_stock, :category_id, :brand_id,:user_id, :image
  
  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.inputs do 
      f.input :image, as: :file
      # f.input :images, as: :file,input_html: {multiple: true}
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

  # show page
  show do
    attributes_table do
      row :title
      row :description
      row :price
      row :in_stock
      row :category_id
      row :brand_id
      row :image do |ad|
        image_tag ad.image
      end
    end
    active_admin_comments
  end


  
end