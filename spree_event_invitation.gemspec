# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_event_invitation'
  s.version     = '0.1.5'
  s.summary     = 'As admin you can create event announcements, which are shown in the storefront'
  s.description = 'Der verlag braucht die möglichkeit, auf veranstaltungen und termine aufmerksam zu machen'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Carsten Heinrigs'
  s.email     = 'carsten@cahein.de'
  s.homepage  = 'http://cahein.de'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.2.0'
  s.add_dependency 'spree_frontend', '~> 2.2.0'
  s.add_dependency 'rails', '~> 4.0.5'
  s.add_dependency 'sprockets', '~> 2.11.0'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1.0'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'logging',  '1.8.2'
end
