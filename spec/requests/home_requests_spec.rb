require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'Spalsh Screen' do
    it 'should display the home page by redirecting' do
      get '/'
      expect(response.status).to eq(200)
      expect(response.body).to include('MyBudget')
      expect(response.body).to include('LOG IN')
    end
  end
end
