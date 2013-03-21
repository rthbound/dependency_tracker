class CreateProjectJavascriptDependencies < ActiveRecord::Migration
  def change
    create_table :project_javascript_dependencies do |t|
      t.integer :javascript_dependency_id
      t.integer :project_id

      t.timestamps
    end
  end
end
