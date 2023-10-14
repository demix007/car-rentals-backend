require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  describe 'POST /login' do
    let(:user) { FactoryBot.create(:user, username: 'test', password: 'password') }

    it 'authenticates the user' do
      post '/api/v1/login', params: { username: user.username, password: 'password' }

      expect(response).to have_http_status(:created)
    end

    it 'returns error when username does not exist' do
      post '/api/v1/login', params: { username: 'test1', password: 'password' }
    end

    it 'returns error when password is incorrect' do
      post '/api/v1/login', params: { username: user.username, password: 'hello' }

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
