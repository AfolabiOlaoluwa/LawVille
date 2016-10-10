# coding: utf-8
require 'set'
module I18n::Tasks
  module MissingKeys

    MISSING_TYPES = {
        used: {glyph: '✗', summary: 'used in code but missing from base locale'},
        diff: {glyph: '∅', summary: 'translated in one locale but not in the other'}
    }

    def self.missing_keys_types
      @missing_keys_types ||= MISSING_TYPES.keys
    end

    def missing_keys_types
      MissingKeys.missing_keys_types
    end

    # @param [:missing_used, :missing_diff] types (default nil)
    # @return [Siblings]
    def missing_keys(opts = {})
      locales = opts[:locales].presence || self.locales
      types   = opts[:types].presence || missing_keys_types
      base    = opts[:base_locale] || base_locale
      types.inject(empty_forest) do |f, type|
        f.merge! send(:"missing_#{type}_forest", locales, base)
      end
    end

    def eq_base_keys(opts = {})
      locales = Array(opts[:locales]).presence || self.locales
      (locales - [base_locale]).inject(empty_forest) { |tree, locale|
        tree.merge! equal_values_tree(locale, base_locale)
      }
    end

    def missing_diff_forest(locales, base = base_locale)
      tree = empty_forest
      # present in base but not locale
      (locales - [base]).each { |locale|
        tree.merge! missing_diff_tree(locale, base)
      }
      if locales.include?(base)
        # present in locale but not base
        (self.locales - [base]).each { |locale|
          tree.merge! missing_diff_tree(base, locale)
        }
      end
      tree
    end

    def missing_used_forest(locales, _base = base_locale)
      locales.inject(empty_forest) { |forest, locale|
        forest.merge! missing_used_tree(locale)
      }
    end

    # keys present in compared_to, but not in locale
    def missing_diff_tree(locale, compared_to = base_locale)
      data[compared_to].select_keys { |key, _node|
        locale_key_missing? locale, depluralize_key(key, compared_to)
      }.set_root_key!(locale, type: :missing_diff).keys { |_key, node|
        # change path and locale to base
        data = {locale: locale, missing_diff_locale: node.data[:locale]}
        if node.data.key?(:path)
          data[:path] = LocalePathname.replace_locale(node.data[:path], node.data[:locale], locale)
        end
        node.data.update data
      }
    end

    # keys used in the code missing translations in locale
    def missing_used_tree(locale)
      used_tree(strict: true).select_keys { |key, _node|
        locale_key_missing?(locale, key)
      }.set_root_key!(locale, type: :missing_used)
    end

    def equal_values_tree(locale, compare_to = base_locale)
      base = data[compare_to].first.children
      data[locale].select_keys(root: false) { |key, node|
        other_node = base[key]
        other_node && node.value == other_node.value && !ignore_key?(key, :eq_base, locale)
      }.set_root_key!(locale, type: :eq_base)
    end

    def locale_key_missing?(locale, key)
      !key_value?(key, locale) && !ignore_key?(key, :missing)
    end

    # @param [::I18n::Tasks::Data::Tree::Siblings] forest
    def collapse_missing_used_locales!(forest)
      locales_and_nodes_by_key = {}
      to_remove                = []
      forest.each do |root|
        locale = root.key
        root.leaves { |node|
          if node.data[:type] == :missing_used
            (locales_and_nodes_by_key[node.full_key(root: false)] ||= []) << [locale, node]
            to_remove << node
          end
        }
      end
      forest.remove_nodes_collapsing_emptied_ancestors! to_remove
      keys_and_nodes_by_locale = {}
      locales_and_nodes_by_key.each { |key, locales_and_nodes|
        locales = locales_and_nodes.map(&:first).sort.join('+')
        (keys_and_nodes_by_locale[locales] ||= []) << [key, locales_and_nodes[0][1]]
      }
      keys_and_nodes_by_locale.map { |locales, keys_nodes|
        keys_nodes.each { |(key, node)|
          forest["#{locales}.#{key}"] = node
        }
      }
      forest
    end
  end
end
