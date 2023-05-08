class ProjectHistory < ApplicationRecord
  belongs_to :project
  validates :status, inclusion: { in: PROJECT_STATUSES }
end
