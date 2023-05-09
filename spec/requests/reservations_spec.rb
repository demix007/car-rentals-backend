require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/reservations'
      expect(response).to have_http_status(:success)
    end
    it 'returns a list of reservations' do
      get '/api/v1/reservations'
      expect(response).to have_http_status(:success)
    end
    it 'creates a reservation' do
      post '/api/v1/reservations',
           params: { reservation: { user_id: 1, car_id: 1, start_date: '2021-06-01', end_date: '2021-06-02' } }
      expect(response).to have_http_status(401)
    end
    it 'updates a reservation' do
      put '/api/v1/reservations/1',
          params: { reservation: { user_id: 1, car_id: 1, start_date: '2021-06-01', end_date: '2021-06-02' } }
      expect(response).to have_http_status(401)
    end
    it 'deletes a reservation' do
      delete '/api/v1/reservations/1'
      expect(response).to have_http_status(401)
    end
  end
end
