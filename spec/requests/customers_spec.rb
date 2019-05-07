require 'rails_helper'

RSpec.describe 'Customers API', type: :request do
  let!(:customers) { create_list(:customer, 9) }
  # Insert an individual customer with an avatar to avoid attaching an image to every record
  before { customers.insert(0, create(:customer, :with_avatar)) }
  let(:customer_id) { customers.first.id }

  # Test suite for GET /customers
  describe 'GET /customers' do
    before { get '/customers' }

    it 'returns customers' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /customers/:id
  describe 'GET /customers/:id' do
    before { get "/customers/#{customer_id}" }

    context 'when the record exists' do
      it 'returns the customer' do
        expect(json).not_to be_empty
        expect(json['record']['id']).to eq(customer_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:customer_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Customer/)
      end
    end
  end

  # Test suite for POST /customers
  describe 'POST /customers' do
    let(:valid_attributes) { { name: 'Tsukki', surname: 'The dog', created_by: '1', updated_by: '1' }}

    context 'when the request is valid' do
      before { post '/customers', params: valid_attributes }

      it 'creates a customer' do
        expect(json['name']).to eq('Tsukki')
        expect(json['surname']).to eq('The dog')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/customers', params: { name: 'Ponsan', surname: 'The dog' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Created by can't be blank, Updated by can't be blank/)
      end
    end
  end

  # Test suite for PUT /customers/:id
  describe 'PUT /customers/:id' do
    let(:valid_attributes) { { name: 'Ponkki' } }

    context 'when the record exists' do
      before { put "/customers/#{customer_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /customers/:id
  describe 'DELETE /customers/:id' do
    before { delete "/customers/#{customer_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end