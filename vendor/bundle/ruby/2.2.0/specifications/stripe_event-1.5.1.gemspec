# -*- encoding: utf-8 -*-
# stub: stripe_event 1.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "stripe_event"
  s.version = "1.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Danny Whalen"]
  s.date = "2016-09-20"
  s.description = "Stripe webhook integration for Rails applications."
  s.email = "daniel.r.whalen@gmail.com"
  s.homepage = "https://github.com/integrallis/stripe_event"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.1"
  s.summary = "Stripe webhook integration for Rails applications."

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 3.1"])
      s.add_runtime_dependency(%q<stripe>, ["~> 1.6"])
      s.add_development_dependency(%q<rails>, [">= 3.1"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.12"])
      s.add_development_dependency(%q<webmock>, ["~> 1.9"])
      s.add_development_dependency(%q<appraisal>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 3.1"])
      s.add_dependency(%q<stripe>, ["~> 1.6"])
      s.add_dependency(%q<rails>, [">= 3.1"])
      s.add_dependency(%q<rspec-rails>, ["~> 2.12"])
      s.add_dependency(%q<webmock>, ["~> 1.9"])
      s.add_dependency(%q<appraisal>, [">= 0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 3.1"])
    s.add_dependency(%q<stripe>, ["~> 1.6"])
    s.add_dependency(%q<rails>, [">= 3.1"])
    s.add_dependency(%q<rspec-rails>, ["~> 2.12"])
    s.add_dependency(%q<webmock>, ["~> 1.9"])
    s.add_dependency(%q<appraisal>, [">= 0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
  end
end
