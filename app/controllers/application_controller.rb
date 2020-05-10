class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :exception
    include CurrentCart
    # def CurrentUser
    #   if session[:user_id]
    #     @user = User.find(session[:user_id])
    #   end
    # end

    # def CurrentCart
    #   if login?
    #     @cart = @user.cart
#https://medium.com/@yxp010/simple-shopping-cart-in-rails-ece6f51b27e6

    before_action :set_cart

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email,:password])
    end
end
