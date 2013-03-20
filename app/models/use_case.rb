# Require all files in app/models/use_case/**/*.rb
Dir["#{File.dirname(__FILE__)}/use_case/**/*.rb"].each { |f| require f }
