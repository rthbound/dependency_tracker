class Dependency < ActiveRecord::Base
  attr_accessible :license, :license_description, :name

  has_many :project_dependencies
  has_many :projects, through: :project_dependencies
end
