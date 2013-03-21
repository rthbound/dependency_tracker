class AddApprovedToJavascriptDependencies < ActiveRecord::Migration
  def change
    add_column :javascript_dependencies, :approved, :boolean
  end
end
