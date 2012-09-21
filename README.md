# Stringtrain

Stringtrain is a handy internal Ruby DSL for creating dynamically pieced-together strings.

## Installation

Add this line to your application's Gemfile:

    gem 'stringtrain'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stringtrain

## Usage

To use Stringtrain, create a new instance of the `Stringtrain::Cab` class, and pass a block to it. Or you can instantize it into a variable, and use the `#part` method separately.

### Global options

- `:part_separator`: A string that will serve as the delimiter between parts. Defaults to a whitespace character. (Defaults to `' '`)

### Individual part options

- `:condition`: An expression that returns true or false (or just an object). If the expression returns false, then the part does not get added. (Defaults to `true`)
- `:prefix`: A string that appears before the part. (Defaults to `nil`)
- `:suffix`: A string that appears after the part. (Defaults to `nil`)
- `:surround_with`: A string or array that will be used around `string`. If it is an array, the first and last elements will be used for the left and right side of `string`. (Defaults to `' '`)

### A simple example
*See the [documentation](http://rubydoc.info/github/mseymour/stringtrain/Stringtrain/Cab:part) for more examples.* 

    Stringtrain::Cab.new do
      part 'A monkey loves to eat', suffix: '...'
      part 'bananas', suffix: '!'
    end
    #=> "A monkey loves to eat... bananas!"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
