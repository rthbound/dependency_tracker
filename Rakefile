#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'csv'

DependencyTracker::Application.load_tasks

namespace :dependencies do
  task csv: :environment do
    result = DependencyTracker::CSVFile.new({
      project_class: Project,
      project_dependencies: [:dependencies, :javascript_dependencies],
      csv_class:     CSV,
      file_class:    File
    }).execute!

    puts "Created dependency manifest: #{result.data[:file]}"
  end
end

