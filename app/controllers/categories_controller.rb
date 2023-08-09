class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.where(author_id: current_user.id).includes([:author]).order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.where(author_id: current_user.id, id: params[:id]).includes([:author])[0]
    @purchases = @category.purchases.order(created_at: :desc)
  end

  def create
    @category = Category.new(category_params)
    @category.author = current_user
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created!'
    else
      render :new, status: 422, notice: 'An error occurred'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
