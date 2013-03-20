module UseCase
  module DependenciesIndex
    class Create < ::UseCase::Base
      def initialize(options)
        load_options(:project, :dependency_class, :dir_class, :find_class, options)
        @errors << TypeError.new('@project.gem_home should be a string') unless @project.gem_home.is_a?(String)
      end

      def execute!
        find_and_create_each_dependency

        if @errors.empty?
          return UseCase::Result.new(data: { project: @project })
        else
          return UseCase::Result.new(data: { project: @project }, errors: @errors)
        end
      end

      private

      def find_and_create_each_dependency
        @dir_class.glob(@project.gem_home +  "/gems/**").each do |gem_source|
          dependency_creator = UseCase::DependenciesIndex::CreateDependencies.new(project: @project, gem_source: gem_source, find_class: @find_class, dependency_class: @dependency_class)
          dependency_creation_result = dependency_creator.execute!

          @project = dependency_creation_result.data[:project]
        end

        @project.save ? true : @errors << "Could not save project dependencies"
      end
    end
  end
end
