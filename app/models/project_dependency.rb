class ProjectDependency < ActiveRecord::Base
  belongs_to :project
  belongs_to :dependency
end
