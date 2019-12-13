require 'rails_helper'

describe "get latest document version route", :type => :request do
  # let!(:documents) {FactoryBot.create_list(:random_documents, 10)}
  i = rand(1..10)
  before {get "/api/v1/documents/#{i}/latest"}

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'returns the correct document' do
    expect(JSON.parse(response.body)['title']).to eq(i.to_s)
  end
end
