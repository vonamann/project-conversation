class Project < ApplicationRecord
  has_many :histories, -> { order('created_at DESC') }, class_name: 'ProjectHistory'
  validates :status, inclusion: { in: PROJECT_STATUSES }

  after_initialize { self.status = PROJECT_DEFAULT_STATUS }

  def change_status_to(new_status)
    Project.transaction do
      # Do nothing if new status is the same as the old one for simplicity
      unless status == new_status
        update(status: new_status)
        raise ActiveRecord::Rollback unless errors.empty?
        history = histories.new(status: new_status)
        unless history.save
          errors.add(:base, history.errors.full_messages.first)
          raise ActiveRecord::Rollback
        end
      end
    end
    errors.empty?
  rescue => e
    errors.add(:base, "Failed to change status: #{e.message}")
    false
  end
end
