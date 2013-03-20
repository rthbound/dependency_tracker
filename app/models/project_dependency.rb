class ProjectDependency < ActiveRecord::Base
  attr_accessible :dependency_id, :project_id

  belongs_to :project
  belongs_to :dependency
end
