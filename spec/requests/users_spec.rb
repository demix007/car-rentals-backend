require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /register' do
    it 'authenticates the user' do
      post '/api/v1/register', params: { user: { username: 'test', password: 'password' } }
      expect(response).to have_http_status(:created)
    end
  end
end
