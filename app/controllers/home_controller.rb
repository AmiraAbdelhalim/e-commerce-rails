class HomeController < ApplicationController
  


  def search  
    if params[:q].blank?  
      redirect_to(root_path, alert: " NO Product With This Name!") and return  
    else  
      @parameter = params[:q].downcase  
      @products = Product.all.where("lower(title) LIKE  :search or lower(description) LIKE :search ", search: '%'+@parameter+'%') 
      # render plain: params[@products].inspect
      # render params().inspect 
    end  
  end

  def index
    @products= Product.all
    @categories =Category.all
    @brands= Brand.all
  end

end
