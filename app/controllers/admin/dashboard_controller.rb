class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_ADMIN_USER"],
                             password: ENV["HTTP_ADMIN_PASSWORD"]
  def show
  end
end
