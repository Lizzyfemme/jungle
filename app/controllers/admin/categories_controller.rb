class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_ADMIN_USER"],
                               password: ENV["HTTP_ADMIN_PASSWORD"]
  def show
   
  end
  def index
    @category = Category.order(:name).all
  end

  # def category_params
  #   params.require(:category).permit(
  #     :name
  #   )
  # end

end
