Feature: Generating a project with TestGen

  Background:
    When I run `test_framework project "test" --driver=watir`

  Scenario: Creating the top level project directory
    Then a directory named "test" should exist
    
  Scenario: Generating the cucumber.yml file
    Then a file named "test/cucumber.yml" should exist
    And the file "test/cucumber.yml" should contain "default: --no-source --color --format pretty"
    
  Scenario: Generating the Gemfile file
    Then a file named "test/Gemfile" should exist
    And the file "test/Gemfile" should contain "gem 'cucumber'"
    And the file "test/Gemfile" should contain "gem 'rspec'"
    And the file "test/Gemfile" should contain "source 'http://rubygems.org'"

    
  Scenario: Generating the Rakefile file
    Then a file named "test/Rakefile" should exist
    And the file "test/Rakefile" should contain "Cucumber::Rake::Task.new(:features)"
    And the file "test/Rakefile" should contain exactly:
    """
    require 'rubygems'
    require 'cucumber'
    require 'cucumber/rake/task'

    Cucumber::Rake::Task.new(:features) do |t|
      t.profile = 'default'
    end

    task :default => :features
    """
  Scenario: Creating the features set of directories
    Then the following directories should exist:
      | test/features                   |
      | test/features/support           |
      | test/features/support/pages     |
      | test/features/support/data      |
      | test/features/step_definitions  |
      | test/lib                        |

  Scenario: Generating the env.rb file
    Then a file named "test/features/support/env.rb" should exist
    And the file "test/features/support/env.rb" should contain "require 'rspec-expectations'"
