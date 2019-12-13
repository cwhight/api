require 'rails_helper'
require 'date'

describe "get timestamped document route", :type => :request do

  before {get "/api/v1/documents/1/#{DateTime.now - 1.5}"}

  it 'returns a document with timestamp less than input' do
    expect(JSON.parse(response.body)['created_at']).to be < DateTime.now - 1.5
  end

  it 'returns status code 2xx' do
    expect(response).to have_http_status(:success)
  end

  before {get "/api/v1/documents/#{rand(11..100)}/#{DateTime.now - 1.5}"}

  it 'returns status code 404' do
    expect(response).to have_http_status(:not_found)
  end

end
