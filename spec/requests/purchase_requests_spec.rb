require 'rails_helper'

describe PurchasesController, type: :request do
  before(:each) do
    @user = User.create(name: 'Sam', email: 'sam@gmail.com', password: 'abcdefgh', password_confirmation: 'abcdefgh')
    @category = Category.create(author: @user, name: 'Gifts', icon: 'https://icon.png')
    @purchase = Purchase.new(author: @user, name: 'Car', amount: 10_000)
  end

  describe 'authenticated user pages' do
    before(:each) do
      sign_in @user
      get new_category_purchase_path(@category.id)
    end

    it 'should render the new action correctly' do
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response).to render_template('purchases/new')
    end

    it 'should render the details of the page' do
      expect(response.body).to include('NEW TRANSACTION')
      expect(response.body).to include(@category.name)
      expect(response.body).to include('Save Transaction')
    end
  end
end
