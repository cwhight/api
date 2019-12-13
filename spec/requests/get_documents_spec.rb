require 'rails_helper'

describe "get all documents route", :type => :request do
  # let!(:documents) {FactoryBot.create_list(:random_documents, 10)}

  before {get '/api/v1/documents'}

  it 'index returns all the documents' do
    expect(JSON.parse(response.body).size).to eq(10)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

end
