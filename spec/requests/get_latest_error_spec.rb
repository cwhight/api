require 'rails_helper'

describe "get latest document version errors route", :type => :request do

  before {get "/api/v1/documents/100/latest"}

  it 'returns status code 404' do
    expect(response).to have_http_status(:not_found)
  end
end
