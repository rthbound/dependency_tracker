module UseCase
  module JavascriptDependenciesIndex
    class Create < ::UseCase::Base
      def initialize(options)
        load_options(:project, :dependency_class, :dir_class, :file_class, :dependency_creator_class, options)
        @errors << TypeError.new('@project.root_path should be a string') unless @project.root_path.kind_of?(String)
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
        @dir_class.glob(@project.root_path +  "/app/assets/javascripts/**/*.js*").each do |js_source|
          dependency_creator = @dependency_creator_class.new({
            project: @project,
            js_source: js_source,
            file_class: @file_class,
            dependency_class: @dependency_class
          })
          dependency_creation_result = dependency_creator.execute!

          @project = dependency_creation_result.data[:project]
        end

        @project.save ? true : @errors << "Could not save project dependencies"
      end
    end
  end
end
