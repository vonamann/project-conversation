class CreateFirstProject < ActiveRecord::Migration[7.0]
  def up
    Project.create(status: PROJECT_DEFAULT_STATUS)
  end

  def down
    Project.destroy_all
  end
end
