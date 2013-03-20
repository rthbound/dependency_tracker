class CreateProjectDependencies < ActiveRecord::Migration
  def change
    create_table :project_dependencies do |t|
      t.integer :project_id
      t.integer :dependency_id

      t.timestamps
    end
  end
end
