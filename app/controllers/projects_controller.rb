class ProjectsController < ApplicationController
  def show
    @project = Project.singleton
  end
end
