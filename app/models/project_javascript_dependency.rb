class ProjectJavascriptDependency < ActiveRecord::Base
  belongs_to :project
  belongs_to :javascript_dependency
end
