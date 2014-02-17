# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "git_camera/version"

Gem::Specification.new do |s|
  s.name        = "git_camera"
  s.version     = GitCamera::VERSION
  s.authors     = ["Adam Howard"]
  s.email       = ["skattyadz+rubygems@gmail.com"]
  s.homepage    = 'http://rubygems.org/gems/git-camera'
  s.summary     = "Git Camera"
  s.description = "Command line tool to capture the visual evolution of a website over time"

  s.rubyforge_project = "git_camera"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "grit"
end
