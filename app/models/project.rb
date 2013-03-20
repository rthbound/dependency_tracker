class Project < ActiveRecord::Base
  require "find"

  attr_accessible :gem_home, :name

  after_create :create_dependency_index

  has_many :project_dependencies
  has_many :dependencies, through: :project_dependencies

  private

  def create_dependency_index
    result = UseCase::DependenciesIndex::Create.new(project: self, dependency_class: Dependency, find_class: Find, dir_class: Dir).execute!

    raise unless result.successful?
  end
end
