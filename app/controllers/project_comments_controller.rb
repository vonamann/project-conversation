class ProjectCommentsController < ApplicationController
  before_action do
    @project = Project.singleton
  end

  def index
    @comments = @project.comments
  end

  def new
  end

  def create
    comment = @project.comments.new(text: params[:comment_text])
    if comment.save
      flash.notice = 'Comment added successfully'
      redirect_to action: :index
    else
      flash.now.alert = "Failed to add new comment: #{comment.errors.full_messages.first}"
      render action: :new
    end
  end
end
