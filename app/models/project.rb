class Project < ApplicationRecord
  validates :status, inclusion: { in: PROJECT_STATUSES }
end
