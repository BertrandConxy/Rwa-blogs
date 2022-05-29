require_relative "config/application"
begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end
# bundle exec rake assets:precompile RAILS_ENV=production
Rails.application.load_tasks