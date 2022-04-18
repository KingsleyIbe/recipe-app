require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Kolly', email: 'test@gmail.com', password: 'password', confirmed_at: Time.now) }
  let(:food) { user.foods.create(name: 'apple', measurement_unit: 'kg', price: 4) }

  describe 'GET /index' do
    before do
      sign_in user
      get foods_path
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('Add Food')
    end
  end
end
