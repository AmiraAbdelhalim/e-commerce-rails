ActiveAdmin.register Store do
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
    # permit_params :name, :summary, :user_id
  permit_params :name, :summary, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :title, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # f.input :user, as: :select, collection: User.where(role: 'teacher').map { |u| [u.name, u.id] }, include_blank: true, allow_blank: false, input_html: { class: 'select2' }
  form do |f|
    f.inputs do
      f.input :user_id, as: :select, collection: User.where(seller: true).map 
      f.input :name
      f.input :summary
    end
    f.actions
  end
  
  

end
