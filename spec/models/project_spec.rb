require 'rails_helper'

RSpec.describe Project do
  before do
    @project = Project.first_or_create
    @original_histories_count = @project.histories.count
  end

  describe '#change_status_to' do
    it 'does nothing if same status passed' do
      @project.change_status_to('created')
      expect(@project.errors).to be_empty
      expect(@project.status).to eq('created')
      expect(@project.histories.count).to eq(@original_histories_count)
    end

    it 'changes status and creates a new history record' do
      @project.change_status_to('progress')
      expect(@project.errors).to be_empty
      expect(@project.status).to eq('progress')
      expect(@project.histories.count).to eq(@original_histories_count + 1)
    end

    it 'rejects incorrect status' do
      @project.change_status_to('foobar')
      expect(@project.errors).not_to be_empty
      expect(@project.histories.count).to eq(@original_histories_count)
    end
  end
end
