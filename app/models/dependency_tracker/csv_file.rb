module DependencyTracker
  class CSVFile < PayDirt::Base
    def initialize(options)
      load_options(:project_class, :project_dependencies, :csv_class, :file_class, options)
    end

    def execute!
      @projects = @project_class.includes(@project_dependencies)

      create_file(generate_csv)
      return PayDirt::Result.new(data: { file: @target }, success: true)
    end

    def generate_csv
      csv_string = @csv_class.generate do |csv|
        csv << [
          "project",
          "name",
          "license",
          "license_description",
          "approved",
          "type"
        ]

        @project_class.includes(@project_dependencies).each do |project|
          project.dependencies.each do |gem_dependency|
            row  = [ project.name, gem_dependency.name ]
            row += [ gem_dependency.license, gem_dependency.license_description ]
            row += [ gem_dependency.approved, "gem" ]

            csv << row
          end

          project.javascript_dependencies.each do |js_dependency|
            row  = [ project.name, js_dependency.name ]
            row += [ js_dependency.license, js_dependency.license_description ]
            row += [ js_dependency.approved, "javascript"]

            csv << row
          end
        end
      end
    end

    def create_file(csv)
      @target = "#{Time.now.to_i}_dependency_manifest.csv"

      @file_class.open(@target, "w+") do |f|
        f.write(csv)
      end or raise StandardError.new("Error writing dependency manifest")
    end
  end
end
