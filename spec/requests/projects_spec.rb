require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "GET /" do
    it 'checks 200 and title' do
      get root_url
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('The Project')
    end
  end
end
