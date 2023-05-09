require 'rails_helper'

RSpec.describe "Cars", type: :request do
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end
end

require 'rails_helper'

RSpec.describe ' cars', type: :request do
  let(:user) { User.create!(username: 'name', password: 'password') }
  let(:valid_attributes) do
    { name: 'Chevrolet', description: 'Car description', photo: 'https://imgd.aeplcdn.com/', price: '1000.00', model: 'new model', user_id: user.id }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Car.create! valid_attributes
      get api_v1_cars_path
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'renders a JSON response with the new s' do
        post api_v1_cars_url, params: { bike: valid_attributes }, as: :json
        expect(response).to be_successful
      end
    end
  end
end
