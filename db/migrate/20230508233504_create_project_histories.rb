class CreateProjectHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :project_histories do |t|
      t.integer :project_id
      t.string :status

      t.timestamps
    end
    add_index :project_histories, %i[project_id created_at]
  end
end
