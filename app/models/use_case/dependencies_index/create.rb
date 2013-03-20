module UseCase
  module DependenciesIndex
    class Create < ::UseCase::Base
      require "find"

      def initialize(options)
        load_options(:project, options)
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
        Dir.glob(@project.gem_home + "/**").each do |dep|
          licenses = find_licenses_for_dependency(dep)
          irrelevant_path_length = dep.split("/").length

          licenses.each do |license|
            name = license.split("/")
            irrelevant_path_length.times { name.shift }

            name = name.first
            dependency = Dependency.find_by_name(name)
            if dependency.present?
              @project.dependencies << dependency
            else
              @project.dependencies << Dependency.create(name: name, license: File.read(license))
            end
          end
        end
        @project.save ? true : @errors << "Could not save project dependencies"
      end

      def find_licenses_for_dependency(dep)
        license_files = []

        Find.find(dep) do |path|
          license_files << path if path.include?("LICENSE")
        end

        license_files
      end
    end
  end
end
