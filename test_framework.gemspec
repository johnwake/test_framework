# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "test_framework/version"

Gem::Specification.new do |s|
  s.name        = "test_framework"
  s.version     = TestFramework::VERSION
  s.authors     = ["John Wakeling"]
  s.email       = ["test-framework@johnwakeling.com"]
  s.homepage    = "http://github.com/johnwake/test_framework"
  s.summary     = %q{A test framework for testers using Cucumber}
  s.description = %q{A framework to build things for software testing using Cucumber}

  s.rubyforge_project = "test_framework"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'thor'
  s.add_dependency 'cucumber'
  s.add_dependency 'rspec'
  s.add_dependency 'require_all'

  s.add_development_dependency 'aruba'
end
