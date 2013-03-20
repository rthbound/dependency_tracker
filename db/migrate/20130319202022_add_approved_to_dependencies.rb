class AddApprovedToDependencies < ActiveRecord::Migration
  def change
    add_column :dependencies, :approved, :boolean
  end
end
