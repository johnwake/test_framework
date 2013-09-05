require 'thor'
require 'test_framework/generators/project'

module TestFramework
  class CLI < Thor
    
    desc "project <project_name>", "Create a new Test Framework for automation testing with Cucumber"
    method_option :driver, :type => :string, :required => false, :desc => "Select a driver:  Valid values are 'watir' or 'capybara'"

    def project(name)
      driver = options[:driver].nil? ? 'none' : options[:driver]
      TestFramework::Generators::Project.start([name, driver])
    end
    
  end
end
