require 'rails_helper'
require 'date'

describe "get timestamped document errors route", :type => :request do

  before {get "/api/v1/documents/#{rand(11..100)}/#{DateTime.now - 1.5}"}

  it 'returns status code 404' do
    expect(response).to have_http_status(:not_found)
  end

end
