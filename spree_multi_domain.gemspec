# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_multi_domain'
  s.version     = '3.0.0'
  s.summary     = 'Adds multiple site support to Spree'
  s.description = 'Multiple Spree stores on different domains - single unified backed for processing orders.'
  s.required_ruby_version = '>= 1.9.2'

  s.authors           = ['Brian Quinn', 'Roman Smirnov', 'David North']
  s.email             = 'brian@railsdog.com'
  s.homepage          = 'http://spreecommerce.com'
  s.rubyforge_project = 'spree_multi_domain'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  version = '~> 3.0.0'
  s.add_dependency 'spree_core', version
  s.add_dependency 'spree_backend', version
  s.add_dependency 'spree_frontend', version
  s.add_dependency 'spree_api', version

  s.add_development_dependency "rspec-rails",  "~> 3.2"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "sass-rails", "~> 4.0.2"
  s.add_development_dependency "coffee-rails", "~> 4.0.0"
  s.add_development_dependency "factory_girl", "~> 4.5.0"
  s.add_development_dependency "capybara", "~> 2.4"
  s.add_development_dependency "ffaker"
end
