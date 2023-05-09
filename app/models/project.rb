class Project < ApplicationRecord
  has_many :histories, -> { order('created_at DESC') }, class_name: 'ProjectHistory', dependent: :destroy
  has_many :comments,  -> { order('created_at DESC') }, class_name: 'ProjectComment', dependent: :destroy
  validates :status, inclusion: { in: PROJECT_STATUSES }

  # Not sure if it’s a correct way to implement singleton
  def self.singleton
    Project.first_or_create
  end

  def change_status_to(new_status)
    Project.transaction do
      # Do nothing if new status is the same as the old one for simplicity
      unless status == new_status.to_s
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
