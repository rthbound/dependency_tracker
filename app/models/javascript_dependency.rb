class JavascriptDependency < ActiveRecord::Base
  has_many :project_javascript_dependencies
  has_many :projects, through: :project_javascript_dependencies
end
