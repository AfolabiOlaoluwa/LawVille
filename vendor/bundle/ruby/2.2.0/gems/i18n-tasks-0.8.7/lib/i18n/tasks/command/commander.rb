# coding: utf-8
require 'i18n/tasks/cli'
require 'i18n/tasks/reports/terminal'
require 'i18n/tasks/reports/spreadsheet'

module I18n::Tasks
  module Command
    class Commander
      include ::I18n::Tasks::Logging

      attr_reader :i18n


      # @param [I18n::Tasks::BaseTask] i18n
      def initialize(i18n)
        @i18n = i18n
      end

      def run(name, opts = {})
        name = name.to_sym
        public_name = name.to_s.tr '_', '-'
        log_verbose "task: #{public_name}(#{opts.map { |k, v| "#{k}: #{v.inspect}" } * ', '})"
        if opts.empty? || method(name).arity.zero?
          send name
        else
          send name, opts
        end
      end

      def set_internal_locale!
        I18n.locale = i18n.internal_locale
      end

      protected

      def terminal_report
        @terminal_report ||= I18n::Tasks::Reports::Terminal.new(i18n)
      end

      def spreadsheet_report
        @spreadsheet_report ||= I18n::Tasks::Reports::Spreadsheet.new(i18n)
      end

      delegate :base_locale, :locales, :t, to: :i18n
    end
  end
end
