require 'rails_helper'

describe "get document history route", :type => :request do

  before {get "/api/v1/documents/#{rand(1..10)}"}

  it 'returns all the revisions for the specified document' do
    expect(JSON.parse(response.body)['revisions'].size).to eq(2)
  end

  it 'returns status code 2xx' do
    expect(response).to have_http_status(:success)
  end

end
