require 'rails_helper'

RSpec.describe "ProjectHistories", type: :request do
  describe "GET /history" do
    it 'checks history is empty' do
      get history_url
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Project history is empty')
    end

    it 'checks history is not empty' do
      project = Project.singleton
      project.change_status_to(:progress)
      get history_url
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('New status')
    end
  end
end
