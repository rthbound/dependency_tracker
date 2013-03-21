class ChangeLicenseToTextForJavascriptDependencies < ActiveRecord::Migration
  def change
    change_column :javascript_dependencies, :license, :text
  end
end
