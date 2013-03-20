module UseCase
  module DependenciesIndex
    class FindLicenses < ::UseCase::Base

      # @find_licenses =  UseCase::DependenciesIndex::FindLicenses.new(find_class: @find_class, source: dep)
      def initialize(options)
        load_options(:find_class, :gem_source, options)
      end

      # @find_licenses.execute!
      def execute!
        licenses = find_licenses_in_source

        if @errors.empty?
          return UseCase::Result.new(data: { licenses: licenses })
        else
          return UseCase::Result.new(data: { licenses: licenses }, errors: @errors)
        end
      end

      private

      # Given the path to a gem, find files with LICENSE in name
      def find_licenses_in_source
        license_files = []

        @find_class.find(@gem_source) do |path|
          license_files << path if path.include?("LICENSE")
        end

        license_files
      end
    end
  end
end
