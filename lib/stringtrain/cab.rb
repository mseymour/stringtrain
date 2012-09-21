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
    # @option opts [Boolean] :condition (true) An expression that returns true or false (or just an object). If the expression returns false, then the part does not get added.
    # @option opts [String] :prefix (nil) A string that appears before the part.
    # @option opts [String] :suffix (nil) A string that appears after the part.
    # @option opts [String,Array] :surround_with (nil) A string or array that will be used around +string+. If it is an array, the first and last elements will be used for the left and right side of +string+.
    # @example Adding two parts together with suffices
    #   Stringtrain::Cab.new do
    #     part 'A monkey loves to eat', suffix: '...'
    #     part 'bananas', suffix: '!'
    #   end
    #   #=> "A monkey loves to eat... bananas!"
    # @example A more complex usage example, making use of `:condition`, `:prefix`, `:suffix`, and `:surround_with`.
    #   Stringtrain::Cab.new {|a|
    #     a.part cd.current.tracknumber.to_s, surround_with: %w{# :}
    #     a.part cd.current.artist, suffix: '-'
    #     a.part cd.current.title
    #     if cd.current.date
    #       a.part '%s (%s)' % [cd.current.album, cd.current.date], surround_with: %w{[ ]}, condition: cd.current.album?
    #     else
    #       a.part cd.current.album, surround_with: %w{[ ]}, condition: cd.current.album?
    #     end
    #   }
    #   #=> #08: Loreena McKennitt - Dante's Prayer [The Book Of Secrets (1997)]
    def part(string, opts={})
      opts = { condition: true, prefix: nil, suffix: nil, surround_with: nil }.merge(opts)
      pieces = [opts[:prefix], string, opts[:suffix]]
      part = if opts[:surround_with].respond_to?(:fetch)
        pieces.insert(-1,opts[:surround_with].last)
        pieces.insert(1,opts[:surround_with].first)
        pieces.compact.join
      else
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