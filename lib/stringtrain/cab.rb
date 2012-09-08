require "active_support/core_ext/object/blank"

module Stringtrain
  class Cab
    attr_accessor :parts, :part_separator

    # @param [Hash] opts Global options for the processor.
    # @option opts [String] :part_separator (' ') A string that will be used as the delimiter between parts.
    def initialize(opts={}, &block)
      opts = { part_separator: ' ' }.merge(opts)
      self.parts = []
      self.part_separator = opts[:part_separator]
      if block_given?
        block.arity == 1 ? yield(self) : instance_eval(&block)
      end
    end

    # @param [String] string A part of the resulting string.
    # @param [Hash] opts Processing options for the part.
    # @option opts [Boolean] :condition (true) An expression that returns true or false. If the expression returns false, then the part does not get added.
    # @option opts [String] :prefix (nil) A string that appears before the part.
    # @option opts [String] :suffix (nil) A string that appears after the part.
    # @option opts [String,Array] :surround_with (' ') A string or array that will be used around +string+. If it is an array, the first and last elements will be used for the left and right side of +string+.
    def part(string, opts={})
      opts = { condition: true, prefix: nil, suffix: nil, surround_with: ' ' }.merge(opts)
      pieces = [opts[:prefix], string, opts[:suffix]]
      part = if opts[:surround_with].respond_to?(:at)
        pieces.insert(-1,opts[:surround_with].last)
        pieces.insert(1,opts[:surround_with].first)
        puts "Pieces: #{pieces.inspect}"
        puts "Pieces compacted: #{pieces.compact.inspect}"
        puts "Pieces joined: #{pieces.compact.join.inspect}"
        pieces.compact.join
      else
        puts "Pieces: #{pieces.inspect}"
        puts "Pieces compacted: #{pieces.compact.inspect}"
        puts "Pieces joined: #{pieces.compact.join(opts[:surround_with]).inspect}"
        pieces.compact.join(opts[:surround_with])
      end
      if !string.blank?
        parts << part if opts[:condition]
      end
    end

    # @return [String] The resultant string.
    def to_s
      parts.join(self.part_separator)
    end
  end
end