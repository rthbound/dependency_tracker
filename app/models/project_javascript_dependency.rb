class ProjectJavascriptDependency < ActiveRecord::Base
  attr_accessible :javascript_dependency_id, :project_id

  belongs_to :project
  belongs_to :javascript_dependency
end
