# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "jekyll_and_hyde/version"

Gem::Specification.new do |s|
  s.name        = "jekyll_and_hyde"
  s.version     = JekyllAndHyde::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jingwen Owen Ou"]
  s.email       = ["owen@owenou.com"]
  s.homepage    = "http://github.com/jingweno/jekyll_and_hyde"
  s.summary     = %q{A simple HTML presentation generator based on jekyll and slippy.}
  s.description = %q{JekyllAndHyde combined the simplicity of website generation via Jekyll with jQuery's Slippy presentation library. Together they create a super-simple, GitHub Pages-compatible slideshow platform in Ruby.}

  s.rubyforge_project = "jekyll_and_hyde"

  s.requirements = ["git 1.6.0.0, or greater"]

  s.add_dependency('thor')

  s.add_development_dependency('rspec')
  s.add_development_dependency('cucumber')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end