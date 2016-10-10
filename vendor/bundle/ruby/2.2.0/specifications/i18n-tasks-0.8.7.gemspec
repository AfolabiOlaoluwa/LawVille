# -*- encoding: utf-8 -*-
# stub: i18n-tasks 0.8.7 ruby lib

Gem::Specification.new do |s|
  s.name = "i18n-tasks"
  s.version = "0.8.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "issue_tracker" => "https://github.com/glebm/i18n-tasks" } if s.respond_to? :metadata=
  s.require_paths = ["lib"]
  s.authors = ["glebm"]
  s.date = "2015-08-07"
  s.description = "i18n-tasks helps you find and manage missing and unused translations.\n\nIt analyses code statically for key usages, such as `I18n.t('some.key')`, in order to report keys that are missing or unused,\npre-fill missing keys (optionally from Google Translate), and remove unused keys.\n"
  s.email = ["glex.spb@gmail.com"]
  s.executables = ["i18n-tasks", "i18n-tasks.cmd"]
  s.files = ["bin/i18n-tasks", "bin/i18n-tasks.cmd"]
  s.homepage = "https://github.com/glebm/i18n-tasks"
  s.licenses = ["MIT"]
  s.post_install_message = "# Install default configuration:\ncp $(i18n-tasks gem-path)/templates/config/i18n-tasks.yml config/\n# Add an RSpec for missing and unused keys:\ncp $(i18n-tasks gem-path)/templates/rspec/i18n_spec.rb spec/\n"
  s.rubygems_version = "2.4.5.1"
  s.summary = "Manage localization and translation with the awesome power of static analysis"

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<erubis>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.18"])
      s.add_runtime_dependency(%q<easy_translate>, [">= 0.5.0"])
      s.add_runtime_dependency(%q<term-ansicolor>, [">= 1.3.2"])
      s.add_runtime_dependency(%q<terminal-table>, [">= 1.5.1"])
      s.add_runtime_dependency(%q<highline>, [">= 1.7.3"])
      s.add_runtime_dependency(%q<i18n>, [">= 0"])
      s.add_development_dependency(%q<axlsx>, ["~> 2.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.3"])
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<erubis>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 2.3.18"])
      s.add_dependency(%q<easy_translate>, [">= 0.5.0"])
      s.add_dependency(%q<term-ansicolor>, [">= 1.3.2"])
      s.add_dependency(%q<terminal-table>, [">= 1.5.1"])
      s.add_dependency(%q<highline>, [">= 1.7.3"])
      s.add_dependency(%q<i18n>, [">= 0"])
      s.add_dependency(%q<axlsx>, ["~> 2.0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.3"])
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<erubis>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 2.3.18"])
    s.add_dependency(%q<easy_translate>, [">= 0.5.0"])
    s.add_dependency(%q<term-ansicolor>, [">= 1.3.2"])
    s.add_dependency(%q<terminal-table>, [">= 1.5.1"])
    s.add_dependency(%q<highline>, [">= 1.7.3"])
    s.add_dependency(%q<i18n>, [">= 0"])
    s.add_dependency(%q<axlsx>, ["~> 2.0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.3"])
    s.add_dependency(%q<yard>, [">= 0"])
  end
end
