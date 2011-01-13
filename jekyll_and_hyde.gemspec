# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "jekyll_and_hyde"

Gem::Specification.new do |s|
  s.name        = "jekyll_and_hyde"
  s.version     = JekyllAndHyde::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jingwen Owen Ou"]
  s.email       = ["owen@owenou.com"]
  s.homepage    = "http://github.com/jingweno/jekyll_and_hyde"
  s.summary     = %q{A simple HTML presentation generator based on jekyll and slippy.}
  s.description = %q{jekyll_and_hyde is a simple HTML presentation generator based on jekyll(https://github.com/mojombo/jekyll) and slippy(https://github.com/Seldaek/slippy).}

  s.rubyforge_project = "jekyll_and_hyde"

  s.add_dependency('thor')

  s.add_development_dependency('rspec')
  s.add_development_dependency('cucumber')
  s.add_development_dependency('fakefs')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end