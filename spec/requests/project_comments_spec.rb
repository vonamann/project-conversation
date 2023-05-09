require 'rails_helper'

RSpec.describe "ProjectComments", type: :request do
  before do
    @project = Project.singleton
  end

  describe "GET /comments" do
    it 'checks 200 and no comments' do
      get comments_url
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('No comments yet')
    end
  end

  describe 'POST /comments' do
    it 'rejects empty comment' do
      post comments_url
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Failed to add new comment')
    end

    it 'saves non-empty comment' do
      post comments_url, params: { comment_text: 'Lorem ipsum' }
      expect(response).to redirect_to(action: :index)
    end
  end
end
