class AddIsSellerToAdminUser < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_users, :is_seller, :boolean,  null: false, default: false
  end
  
  AdminUser.create! do |seller|
    seller.email     = 'seller@gmail.com'
    seller.password    = '123456789'
  end
end
