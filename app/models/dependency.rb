class Dependency < ActiveRecord::Base
  has_many :project_dependencies
  has_many :projects, through: :project_dependencies
end
