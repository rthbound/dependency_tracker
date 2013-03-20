class CreateDependencies < ActiveRecord::Migration
  def change
    create_table :dependencies do |t|
      t.string :name
      t.text :license
      t.string :license_description

      t.timestamps
    end
  end
end
