require 'rails_helper'

describe "get latest document version route", :type => :request do
  # let!(:documents) {FactoryBot.create_list(:random_documents, 10)}
  before {get "/api/v1/documents/#{rand(1..10)}/latest"}

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
