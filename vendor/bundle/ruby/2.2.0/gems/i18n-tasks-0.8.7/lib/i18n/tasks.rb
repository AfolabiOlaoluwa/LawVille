# coding: utf-8
# define all the modules to be able to use ::
module I18n
  module Tasks
    class << self
      def gem_path
        File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
      end

      def verbose?
        @verbose
      end

      def verbose=(value)
        @verbose = value
      end
    end

    @verbose = !!ENV['VERBOSE']

    module Data
    end
  end
end


require 'active_support/inflector'
require 'active_support/core_ext/hash'
require 'active_support/core_ext/array/access'
require 'active_support/core_ext/array/extract_options'
require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/object/blank'
begin
  # activesupport >= 3
  require 'active_support/core_ext/object/try'
rescue LoadError => _e
  # activesupport ~> 2.3.2
  require 'active_support/core_ext/try'
end
require 'term/ansicolor'
require 'erubis'

require 'i18n/tasks/version'
require 'i18n/tasks/base_task'

# Add internal locale data to i18n gem load path
require 'i18n'
Dir[File.join(I18n::Tasks.gem_path, 'config', 'locales', '*.yml')].each do |locale_file|
  I18n.config.load_path << locale_file
end
