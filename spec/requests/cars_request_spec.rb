require 'rails_helper'
RSpec.describe 'Cars', type: :request do
  describe 'GET /api/v1/cars' do
    let(:user) { create(:user) }
    it 'returns http success' do
      get '/api/v1/cars'
      expect(response).to have_http_status(:success)
    end
    it 'returns a list of cars' do
      get '/api/v1/cars'
      expect(json).to eq []
    end
  end
  describe 'POST /api/v1/cars/:id' do
    let(:user) { create(:user) }
    it 'creates a car' do
      post '/api/v1/cars',
           params: { car: { name: 'My Car', description: 'My Car description', photo: 'My Car photo', price: 100,
                            model: 'My Car model', user: user.id } }
      expect(json['name']).to eq nil
    end
    it 'updates a car' do
      post '/api/v1/cars',
           params: { car: { name: 'My Car', description: 'My Car description', photo: 'My Car photo', price: 100,
                            model: 'My Car model', user: user.id } }
      expect(json['name']).to eq nil
    end
    it 'deletes a car' do
      post '/api/v1/cars',
           params: { car: { name: 'My Car', description: 'My Car description', photo: 'My Car photo', price: 100,
                            model: 'My Car model', user: user.id } }
      expect(json['name']).to eq nil
    end
  end
end
