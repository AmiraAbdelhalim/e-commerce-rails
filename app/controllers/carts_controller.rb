class CartsController < ApplicationController
  include CurrentCart
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!,:only =>[:new , :create,:edit, :update,:destroy ] 

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  # def create
  #   # .merge(user_id:current_user.id)
  #   @cart = Cart.new(cart_params.merge(user_id:current_user.id))
  #   if @cart.save
  #     redirect_to @cart
  #   else
  #     render :new
  #   end 
  # end

  # def create
  #     @cart = Cart.new(cart_params.merge(user_id:current_user.id))
  #     if @cart.save
  #       redirect_to @cart, notice: 'CART CREATE.' 
  #       # format.json { render :show, status: :created, location: @line_item }
  #     else
  #       render :new 
  #       # format.json { render json: @line_item.errors, status: :unprocessable_entity }
  #     end
  # end
  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        # format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        # format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
    # if @cart.update(cart_params)
    #   redirect_to @cart
    # else
    #   render :edit
    # end
    
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy if @cart.id == session[:cart_id] # delete one item from the cart
    session[:cart_id] = nil
    respond_to do |format|  # empty card
      format.html { redirect_to root_path, notice: 'Cart was successfully destroyed.' }
    end
    end
  
  
    # DELETE /carts/1
  # DELETE /carts/1.json
  # def destroy
  #     @cart.destroy if @cart.id == session[:cart_id] # delete one item from the cart
  #     session[:cart_id] = nil
  #     respond_to do |format|  # empty card
  #       format.html { redirect_to root_path, notice: 'Cart was successfully destroyed.' }
  #     end
  #   end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_cart
    #   @cart = Cart.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.fetch(:cart, {})
    end

    # def cart_params
    #   params.require(:cart).permit(:user_id)
    # end

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_path, notice: "That cart doesn't exist"
    end
end
