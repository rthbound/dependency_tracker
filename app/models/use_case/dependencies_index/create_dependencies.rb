module UseCase
  module DependenciesIndex
    class CreateDependencies < ::UseCase::Base
      def initialize(options)
        load_options(:project, :gem_source, :find_class, :dependency_class, options)
      end

      # @find_licenses.execute!
      def execute!
        create_dependencies
        if @errors.empty?
          return UseCase::Result.new(data: { project: @project })
        else
          return UseCase::Result.new(data: { licenses: @project }, errors: @errors)
        end
      end

      private
      def create_dependencies
        dependency_name = @gem_source.split("/")[-1]
        licenses = find_licenses_in_gem_source

        licenses.each do |license|
          dependency = @dependency_class.find_by_name(dependency_name)

          if dependency.present?
            @project.dependencies << dependency
          else
            @project.dependencies << @dependency_class.create(name: dependency_name, license: File.read(license))
          end
        end
      end

      # Given the path to a gem, find files with LICENSE in name
      def find_licenses_in_gem_source
        license_finder = UseCase::DependenciesIndex::FindLicenses.new(find_class: @find_class, gem_source: @gem_source)
        license_finder_result = license_finder.execute!

        license_finder_result.data[:licenses]
      end
    end
  end
end
