module UseCase
  module JavascriptDependenciesIndex
    class CreateJavascriptDependencies < ::UseCase::Base
      def initialize(options)
        load_options(:project, :js_source, :dependency_class, :file_class, options)
      end

      # @find_licenses.execute!
      def execute!
        create_dependencies
        if @errors.empty?
          return UseCase::Result.new(data: { project: @project })
        else
          return UseCase::Result.new(data: { project: @project }, errors: @errors)
        end
      end

      private
      def create_dependencies
        dependency_name = @js_source.split("/")[-1]
        license = find_license_in_js_source
        dependency = @dependency_class.where(name: dependency_name, license: license).first

        if dependency.present?
          @project.javascript_dependencies << dependency
        else
          @project.javascript_dependencies << @dependency_class.create(name: dependency_name, license: license)
        end
      end

      # Given the path to a gem, find files with LICENSE in name
      def find_license_in_js_source
        file = @file_class.open(@js_source)

        license_finder = UseCase::JavascriptDependenciesIndex::FindLicenses.new(file: file)
        license_finder_result = license_finder.execute!

        file.close

        license_finder_result.data[:license]
      end
    end
  end
end
