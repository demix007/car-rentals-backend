RSpec.describe 'Cars', type: :request do

  let!(:cars) { create_list(:car, 10) }

  let(:car_id) { cars.first.id }

  describe 'GET /cars' do
    before { get '/api/v1/cars' }
    it 'returns list of cars' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /cars/:id' do
    before { get "/api/v1/cars/#{car_id}" }

    context 'when car exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the car item' do
        expect(json['id']).to eq(car_id)
      end
    end

    context 'when car does not exist' do
      let(:car_id) { 0 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find Car with 'id'=0")
      end
    end
  end

  describe 'POST /cars/:id' do
    let!(:racecar) { create(:category) }
    let(:valid_attributes) do
      { 
        name: 'Ferrari', 
        description: 'A top race car', 
        photo: 'image url', 
        price: '25.00', 
        model: 'latest model',
        user_id: racecar.id
      }
    end

    context 'when request attributes are valid' do
      before { post '/api/v1/cars', params: valid_attributes }
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post '/api/v1/cars', params: {} }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a failure message' do
        expect(response.body).to include("can't be blank")
      end
    end
  end

  describe 'PUT /cars/:id' do
    let(:valid_attributes) { { name: 'Ferrari' } }
    before { put "/api/v1/cars/#{car_id}", params: valid_attributes }
    context 'when car exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
      it 'updates the car' do
        updated_item = Car.find(car_id)
        expect(updated_item.title).to match(/Ferrari/)
      end
    end
    context 'when the car does not exist' do
      let(:car_id) { 0 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find Car with 'id'=0")
      end
    end
  end

  describe 'DELETE /cars/:id' do
    before { delete "/api/v1/cars/#{car_id}" }
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
 end