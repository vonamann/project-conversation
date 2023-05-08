class Project < ApplicationRecord
  has_many :histories, -> { order('created_at DESC') }, class_name: 'ProjectHistory'
  validates :status, inclusion: { in: PROJECT_STATUSES }

  after_initialize { self.status = PROJECT_DEFAULT_STATUS }
end
