class ProjectsController < ApplicationController
  before_action do
    @project = Project.singleton
  end

  def show
  end

  def update
    if @project.change_status_to(params[:status])
      flash.notice = "Status successfully changed to “#{params[:status]}”"
    else
      flash.alert = "Failed to change status: #{@project.errors.full_messages.first}"
    end
    redirect_to root_path
  end
end
