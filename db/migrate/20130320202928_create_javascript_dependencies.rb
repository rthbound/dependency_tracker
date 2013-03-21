class CreateJavascriptDependencies < ActiveRecord::Migration
  def change
    create_table :javascript_dependencies do |t|
      t.string :name
      t.string :license
      t.string :license_description

      t.timestamps
    end
  end
end
