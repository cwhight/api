require 'rails_helper'

describe "post document route", :type => :request do
  # let!(:documents) {FactoryBot.create_list(:random_documents, 10)}
  i = rand(1..10)
  before do
    post "/api/v1/documents/#{i}", params: { content: "something new" }
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  before {get "/api/v1/documents/#{i}/latest"}


  it 'latest now returns the updated version of the document' do
    expect(JSON.parse(response.body)['content']).to eq("something new")
  end

  it 'still returns status code 200' do
    expect(response).to have_http_status(:success)
  end

end
