require 'rails_helper'

RSpec.describe ProjectComment do
  before do
    @project = Project.singleton
    @original_comments_count = @project.comments.count
  end

  context 'Validations' do
    it 'checks that empty comments doesn’t get saved' do
      comment = @project.comments.create
      expect(comment.errors).not_to be_empty
      expect(comment.errors.full_messages.first).to be_include('can\'t be blank')
    end

    it 'checks that non-empty comment gets saved successfully' do
      comment = @project.comments.create(text: 'Lorem ipsum')
      expect(comment.errors).to be_empty
      expect(@project.comments.count).to eq(@original_comments_count + 1)
    end
  end
end
