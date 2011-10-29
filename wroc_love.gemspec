# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wroc_love/version"

Gem::Specification.new do |s|
  s.name        = "wroc_love"
  s.version     = WrocLove::VERSION
  s.date        = "2011-10-29"
  s.authors     = ["Norbert Wojtowicz", "Robert Pankowecki"]
  s.email       = ["wojtowicz.norbert@gmail.com", "robert.pankowecki@gmail.com"]
  s.homepage    = "http://github.com/drugpl/wroc_love.rb"
  s.summary     = "wroc_love.rb Conference 2012"
  s.description = "Your personal genie for all your wroc_love.rb 2012 needs!"
  s.licenses    = ["MIT"]

  s.require_paths = ["lib"]
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = ["wroc_love.rb"]
 
  s.rubyforge_project = "wroc_love"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<launchy>, ["~> 0.4.0"])
      s.add_runtime_dependency(%q<geocoder>, ["~> 1.0.2"])
      s.add_runtime_dependency(%q<json>, ["1.5.3"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
    else
      s.add_dependency(%q<launchy>, ["~> 0.4.0"])
      s.add_dependency(%q<geocoder>, ["~> 1.0.2"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<json>, ["1.5.3"])
    end
  else
    s.add_dependency(%q<launchy>, ["~> 0.4.0"])
    s.add_dependency(%q<geocoder>, ["~> 1.0.2"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<json>, ["1.5.3"])
  end
end

