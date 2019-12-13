require 'rails_helper'

describe "get latest document version route", :type => :request do

  i = rand(1..10)
  before {get "/api/v1/documents/#{i}/latest"}

  it 'returns status code 2xx' do
    expect(response).to have_http_status(:success)
  end

  it 'returns the correct document' do
    expect(JSON.parse(response.body)['title']).to eq(i.to_s)
  end

  before {get "/api/v1/documents/#{rand(11..100)}/latest"}

  it 'returns status code 404' do
    expect(response).to have_http_status(:not_found)
  end
end
