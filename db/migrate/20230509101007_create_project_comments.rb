class CreateProjectComments < ActiveRecord::Migration[7.0]
  def change
    create_table :project_comments do |t|
      t.integer :project_id
      t.text :text, null: false

      t.timestamps
    end
    add_index :project_comments, %i[project_id created_at]
  end
end
