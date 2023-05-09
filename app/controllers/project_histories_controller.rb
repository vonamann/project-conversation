class ProjectHistoriesController < ApplicationController
  def index
    project = Project.singleton
    @histories = project.histories
  end
end
