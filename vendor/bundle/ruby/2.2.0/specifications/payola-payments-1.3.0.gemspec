# -*- encoding: utf-8 -*-
# stub: payola-payments 1.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "payola-payments"
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Pete Keen"]
  s.date = "2015-03-01"
  s.description = "One-off and subscription payments for your Rails application"
  s.email = ["pete@payola.io"]
  s.homepage = "https://www.payola.io"
  s.licenses = ["LGPL-3.0"]
  s.post_install_message = "Please ensure that your Payola route has 'as: :payola' included. Prior to v1.0.7 this was not added automatically.\n"
  s.rubygems_version = "2.4.5.1"
  s.summary = "Drop-in Rails engine for accepting payments with Stripe"

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 4.1"])
      s.add_runtime_dependency(%q<jquery-rails>, [">= 0"])
      s.add_runtime_dependency(%q<stripe>, [">= 1.20.1"])
      s.add_runtime_dependency(%q<aasm>, [">= 4.0.7"])
      s.add_runtime_dependency(%q<stripe_event>, [">= 1.3.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<factory_girl_rails>, [">= 0"])
      s.add_development_dependency(%q<stripe-ruby-mock>, ["~> 2.1.0"])
      s.add_development_dependency(%q<sucker_punch>, ["~> 1.2.1"])
      s.add_development_dependency(%q<docverter>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 4.1"])
      s.add_dependency(%q<jquery-rails>, [">= 0"])
      s.add_dependency(%q<stripe>, [">= 1.20.1"])
      s.add_dependency(%q<aasm>, [">= 4.0.7"])
      s.add_dependency(%q<stripe_event>, [">= 1.3.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<factory_girl_rails>, [">= 0"])
      s.add_dependency(%q<stripe-ruby-mock>, ["~> 2.1.0"])
      s.add_dependency(%q<sucker_punch>, ["~> 1.2.1"])
      s.add_dependency(%q<docverter>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 4.1"])
    s.add_dependency(%q<jquery-rails>, [">= 0"])
    s.add_dependency(%q<stripe>, [">= 1.20.1"])
    s.add_dependency(%q<aasm>, [">= 4.0.7"])
    s.add_dependency(%q<stripe_event>, [">= 1.3.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<factory_girl_rails>, [">= 0"])
    s.add_dependency(%q<stripe-ruby-mock>, ["~> 2.1.0"])
    s.add_dependency(%q<sucker_punch>, ["~> 1.2.1"])
    s.add_dependency(%q<docverter>, [">= 0"])
  end
end
