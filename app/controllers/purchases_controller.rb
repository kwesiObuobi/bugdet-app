class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def new
    @purchase = Purchase.new
    @categories = Category.where(author_id: current_user.id).includes([:author]).order(created_at: :desc)
    @selected_category = Category.find(params[:category_id])
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.author = current_user

    if @purchase.save
      params[:category_ids].each do |id|
        CategoriesPurchases.create(category_id: id.to_i, purchase_id: @purchase.id)
      end
      redirect_to category_path(params[:category_id]), notice: 'Transaction added successfully'
    else
      render :new, status: 422
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:name, :amount)
  end
end
