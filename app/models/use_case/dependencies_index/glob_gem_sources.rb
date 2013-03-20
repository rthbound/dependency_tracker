module UseCase
  module DependenciesIndex
    class FindLicenses < ::UseCase::Base
      def initialize(options)
        load_options(:project, :dir_class, :find_class, options)
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

      # Given a folder full of gems, find them all
      def find_and_create_each_dependency
        glob_gem_sources = UseCase::DependenciesIndex::GlobGemSources.new(dir_class: @dir_class, gem_home: @project.gem_home)
        glob_gem_sources_result = glob_gem_sources.execute!

        @dir_class.glob(@project.gem_home + "/**").each do |dep|
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

      # Given the path to a gem, find files with LICENSE in name
      def find_licenses_for_dependency(dep)
        license_finder = UseCase::DependenciesIndex::FindLicenses.new(find_class: @find_class, source: dep)
        license_finder_result = license_finder.execute!

        license_finder_result.data[:licenses]
      end
    end
  end
end
