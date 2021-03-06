class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_ADMIN_USER"],
                               password: ENV["HTTP_ADMIN_PASSWORD"]
  def show
    @products = Product.order(id: :desc).all
    @quantity_total = Product.sum(:quantity)
    @product_count = Product.count(:name)
    @product_category_count = Product.uniq.count(:category_id)
    
  end



  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end
 

end

