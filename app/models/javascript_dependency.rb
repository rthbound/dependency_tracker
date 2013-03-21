class JavascriptDependency < ActiveRecord::Base
  attr_accessible :license, :license_description, :name

  has_many :project_javascript_dependencies
  has_many :projects, through: :project_javascript_dependencies
end
