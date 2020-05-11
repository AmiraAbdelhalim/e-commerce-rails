module CurrentCart

    private
    def set_cart
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  
    # def set_cart
    #   @cart = Cart.find_or_initialize_by_id(session[:cart_id], user_id: session[:user_id])
    #   # @cart.user_id = current_user.id trial to add user id to the cart
    #   # @cart.save
    # # rescue ActiveRecord::RecordNotFound
    #   # @cart = Cart.create!(user_id:current_user.id)
    #   # @cart= Cart.create
      
    #   # session[:user_id]= current_user.id
    #   if @cart.new_record?
    #     @order.save!
    #     session[:cart_id] = @cart.id
    #   # @cart
    #   end
    # end

    # def set_cart
    #   @cart = Cart.find_or_create_by(session[:cart_id])
    #   if @cart.new_record?
    #     @cart = Cart.create!(user_id:current_user.id)
    #     @cart.save!
    #     session[:cart_id] = @cart.id
    #   end
    # end
  end