class HomeController < ApplicationController
  def index
    return unless current_user

    redirect_to '/categories'
  end
end
