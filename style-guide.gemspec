$:.push File.expand_path("../lib", __FILE__)
require "style_guide/version"

Gem::Specification.new do |s|
  s.name        = "style-guide"
  s.version     = StyleGuide::VERSION
  s.license     = "MIT"
  s.authors     = ["Negative"]
  s.homepage    = "https://github.com/cantarefacile/style-guide"
  s.summary     = "A style guide for your Rails application."
  s.description = "A mountable Rails engine where you curate and view your site's visual elements."

  s.files         = `git ls-files`.split( "\n" ) - %w(Gemfile.lock)
  s.test_files    = `git ls-files -- spec/*`.split( "\n" )
  s.require_paths = ["lib"]

  s.add_dependency "rails", ">= 3.2", "< 5.0"
  s.add_dependency "nokogiri", ">= 1.5"
  s.add_dependency "github-markdown", ">= 0.5"
  s.add_dependency "jquery-rails", ">= 3.0"

  s.add_development_dependency "rspec-rails"
end
