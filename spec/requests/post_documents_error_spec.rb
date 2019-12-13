require 'rails_helper'

describe "post document errors route", :type => :request do
  before do
    post "/api/v1/documents/100", params: { content: "something new" }
  end

  it 'returns status code 404' do
    expect(response).to have_http_status(:not_found)
  end
end
