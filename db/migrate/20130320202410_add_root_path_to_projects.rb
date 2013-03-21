class AddRootPathToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :root_path, :string
  end
end
