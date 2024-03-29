require 'rails_helper'

describe "get all documents route", :type => :request do

  before {get '/api/v1/documents'}

  it 'index returns all the documents' do
    expect(JSON.parse(response.body).size).to eq(10)
  end

  it 'returns status code 2xx' do
    expect(response).to have_http_status(:success)
  end

end
