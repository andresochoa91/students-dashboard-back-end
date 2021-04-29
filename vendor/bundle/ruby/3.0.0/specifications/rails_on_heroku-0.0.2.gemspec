# -*- encoding: utf-8 -*-
# stub: rails_on_heroku 0.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "rails_on_heroku".freeze
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Richard Schneeman".freeze, "Terence Lee".freeze]
  s.date = "2013-06-17"
  s.description = "Make Running Rails 4 on Heroku easier".freeze
  s.email = ["richard@heroku.com".freeze, "terence@heroku.com".freeze]
  s.homepage = "https://github.com/heroku/rails_on_heroku".freeze
  s.licenses = ["LICENSE".freeze]
  s.rubygems_version = "3.2.15".freeze
  s.summary = "Configures your app to log to stdout and to serve assets in production.".freeze

  s.installed_by_version = "3.2.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails_serve_static_assets>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<rails_stdout_logging>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rails_serve_static_assets>.freeze, [">= 0"])
    s.add_dependency(%q<rails_stdout_logging>.freeze, [">= 0"])
  end
end
