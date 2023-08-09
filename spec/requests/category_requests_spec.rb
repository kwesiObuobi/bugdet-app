require 'rails_helper'

describe CategoriesController, type: :request do
  before(:each) do
    @user = User.create(name: 'Sam', email: 'sam@gmail.com', password: 'abcdefgh', password_confirmation: 'abcdefgh')
    @category = Category.create(author: @user, name: 'Gifts', icon: 'https://icon.png')
  end

  describe 'authenticated user pages' do
    before(:each) do
      sign_in @user
      get '/categories'
    end

    it 'should render the index action correctly' do
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response).to render_template('categories/index')
      expect(response.body).to include('CATEGORIES')
    end

    it 'should render the new category created' do
      expect(response.body).to include(@category.name)
    end

    it 'should show button to create new category' do
      expect(response.body).to include('ADD NEW CATEGORY')
    end

    it 'should render the new category page' do
      get new_category_path
      expect(response.status).to eq(200)
      expect(response.body).to include('NEW CATEGORY')
      expect(response.body).to include('Save')
    end

    it 'should render the Category details page' do
      get category_path(@category.id)
      expect(response.status).to eq(200)
      expect(response.body).to include(@category.name)
    end
  end
end
