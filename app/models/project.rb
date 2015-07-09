class Project < ActiveRecord::Base
  require "find"

  after_create :create_gem_dependency_index
  after_create :create_js_dependency_index

  has_many :project_dependencies
  has_many :dependencies, through: :project_dependencies

  has_many :project_javascript_dependencies
  has_many :javascript_dependencies, through: :project_javascript_dependencies
  private

  def create_gem_dependency_index
    result = UseCase::DependenciesIndex::Create.new({
      project:          self,
      dependency_class: Dependency,
      find_class:       Find,
      dir_class:        Dir
    }).execute!

    raise unless result.successful?
  end

  def create_js_dependency_index
    result = UseCase::JavascriptDependenciesIndex::Create.new({
      project:                  self,
      dependency_class:         JavascriptDependency,
      dependency_creator_class: UseCase::JavascriptDependenciesIndex::CreateJavascriptDependencies,
      file_class:               File,
      dir_class:                Dir
    }).execute!

    raise unless result.successful?
  end
end
