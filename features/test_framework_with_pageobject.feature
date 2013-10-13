Feature: Adding support for the --pageobject-driver option


  Scenario: Adding page-object to the Gemfile
    When I run `test_framework project test --driver=watir`
    Then a file named "test/Gemfile" should exist
    And the file "test/Gemfile" should contain "gem 'page-object'"
    
  Scenario: Adding page-object to env.rb
    When I run `test_framework project test --driver=watir`
    Then a file named "test/features/support/env.rb" should exist
    And the file "test/features/support/env.rb" should contain "require 'page-object'"
    And the file "test/features/support/env.rb" should contain "World(PageObject::PageFactory)"
    
  Scenario: Adding the hook file for Watir  
    When I run `test_framework project test --driver=watir`
    Then a file named "test/features/support/hooks.rb" should exist
    And the file "test/features/support/hooks.rb" should contain "require 'watir-webdriver'"
    And the file "test/features/support/hooks.rb" should contain "@browser = Watir::Browser.new :firefox"
    
  Scenario: Adding the hook file for Selenium
    When I run `test_framework project test --driver=capybara`
    Then a file named "test/features/support/hooks.rb" should exist
    And the file "test/features/support/hooks.rb" should contain "require 'selenium-webdriver'"
    And the file "test/features/support/hooks.rb" should contain "@browser = Selenium::WebDriver.for :firefox"
  
  Scenario: Creating the pages directory
    When I run `test_framework project test --driver=selenium`
    Then a directory named "test/features/support/pages" should exist
    
