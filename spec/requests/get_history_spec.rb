require 'rails_helper'

describe "get all documents route", :type => :request do
  # let!(:documents) {FactoryBot.create_list(:random_documents, 10)}
  before {get "/api/v1/documents/#{rand(1..10)}"}

  it 'returns all the revisions for the specified document' do
    expect(JSON.parse(response.body)['revisions'].size).to eq(2)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
