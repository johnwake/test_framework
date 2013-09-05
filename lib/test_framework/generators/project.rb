require 'thor/group'

module TestFramework
  module Generators
    class Project < Thor::Group
      include Thor::Actions

      desc "Generates a project structure for testing with Cucumber"
      argument :name, :type => :string, :desc => 'The name of the test project'
      argument :driver, :type => :string, :desc => 'Driver you want to use'

      def self.source_root
        File.dirname(__FILE__) + "/project"
      end
    
      def create_top_directory
        empty_directory(name)
      end
      
      def create_cucumber_directories
        empty_directory("#{name}/lib")
        empty_directory("#{name}/features")
        empty_directory("#{name}/features/support")
        empty_directory("#{name}/features/support/pages")
        empty_directory("#{name}/features/support/helpers")
        empty_directory("#{name}/features/step_definitions")
      end

      def copy_cucumber_yml
        template "cucumber.yml.tt", "#{name}/cucumber.yml"
      end
      
      def copy_env_config
        template "env_config.rb.tt", "#{name}/lib/env_config.rb"
      end

      def copy_gemfile
        template "Gemfile.tt", "#{name}/Gemfile"
      end

      def copy_rakefile
        copy_file "Rakefile", "#{name}/Rakefile"
      end
      
      def copy_env
        template "env.rb.tt", "#{name}/features/support/env.rb"
      end
      
      def copy_hooks
        template "hooks.rb.tt", "#{name}/features/support/hooks.rb" unless no_driver_selected
      end
      
      private
      
      def no_driver_selected
        driver.downcase == 'none'
      end
    end
  end
end
