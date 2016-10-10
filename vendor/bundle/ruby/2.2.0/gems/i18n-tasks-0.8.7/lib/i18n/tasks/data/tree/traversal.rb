# coding: utf-8
module I18n::Tasks
  module Data::Tree
    # Any Enumerable that yields nodes can mix in this module
    module Traversal

      def nodes(&block)
        depth_first(&block)
      end

      def leaves(&visitor)
        return to_enum(:leaves) unless visitor
        nodes do |node|
          visitor.yield(node) if node.leaf?
        end
        self
      end

      def levels(&block)
        return to_enum(:levels) unless block
        nodes = to_nodes
        unless nodes.empty?
          block.yield nodes
          if nodes.size == 1
            node = first
            node.children.levels(&block) if node.children?
          else
            Nodes.new(nodes: nodes.children).levels(&block)
          end
        end
        self
      end

      def breadth_first(&visitor)
        return to_enum(:breadth_first) unless visitor
        levels do |nodes|
          nodes.each { |node| visitor.yield(node) }
        end
        self
      end

      def depth_first(&visitor)
        return to_enum(:depth_first) unless visitor
        each { |node|
          visitor.yield node
          node.children.each do |child|
            child.depth_first(&visitor)
          end if node.children?
        }
        self
      end

      # @option root include root in full key
      def keys(key_opts = {}, &visitor)
        key_opts[:root] = false unless key_opts.key?(:root)
        return to_enum(:keys, key_opts) unless visitor
        leaves { |node| visitor.yield(node.full_key(key_opts), node) }
        self
      end


      def key_names(opts = {})
        opts[:root] = false unless opts.key?(:root)
        keys(opts).map { |key, _node| key }
      end

      def key_values(opts = {})
        opts[:root] = false unless opts.key?(:root)
        keys(opts).map { |key, node| [key, node.value] }
      end

      def root_key_values(sort = false)
        result = keys(root: false).map { |key, node| [node.root.key, key, node.value] }
        result.sort! { |a, b| a[0] != b[0] ? a[0] <=> b[0] : a[1] <=> b[1] } if sort
        result
      end

      #-- modify / derive

      # Select the nodes for which the block returns true. Pre-order traversal.
      # @return [Siblings] a new tree
      def select_nodes(&block)
        tree = Siblings.new
        each do |node|
          if block.yield(node)
            tree.append! node.derive(
                             parent:   tree.parent,
                             children: (node.children.select_nodes(&block).to_a if node.children)
                         )
          end
        end
        tree
      end

      # Select the nodes for which the block returns true. Pre-order traversal.
      # @return [Siblings] self
      def select_nodes!(&block)
        to_remove = []
        each do |node|
          if block.yield(node)
            node.children.select_nodes!(&block) if node.children
          else
            # removing during each is unsafe
            to_remove << node
          end
        end
        to_remove.each { |node| remove! node }
        self
      end

      # @return Siblings
      def select_keys(opts = {}, &block)
        root = opts.key?(:root) ? opts[:root] : false
        ok   = {}
        keys(root: root) do |full_key, node|
          if block.yield(full_key, node)
            node.walk_to_root { |p|
              break if ok[p]
              ok[p] = true
            }
          end
        end
        select_nodes { |node|
          ok[node]
        }
      end

      # @return Siblings
      def intersect_keys(other_tree, key_opts = {}, &block)
        if block
          select_keys(key_opts) { |key, node|
            other_node = other_tree[key]
            other_node && block.call(key, node, other_node)
          }
        else
          select_keys(key_opts) { |key, node| other_tree[key] }
        end
      end

      def grep_keys(match, opts = {})
        select_keys(opts) do |full_key, _node|
          match === full_key
        end
      end

      def set_each_value!(val_pattern, key_pattern = nil, &value_proc)
        value_proc ||= proc { |node|
          node_value = node.value
          human_key  = ActiveSupport::Inflector.humanize(node.key.to_s)
          full_key = node.full_key
          StringInterpolation.interpolate_soft(
              val_pattern,
              value: node_value,
              human_key: human_key,
              key: full_key,
              value_or_human_key: node_value.presence || human_key
          )
        }
        if key_pattern.present?
          pattern_re = I18n::Tasks::KeyPatternMatching.compile_key_pattern(key_pattern)
        end
        keys.each do |key, node|
          next if pattern_re && key !~ pattern_re
          node.value = value_proc.call(node)
        end
        self
      end
    end
  end
end
