require "stringtrain/version"
require "stringtrain/cab"

module Stringtrain
  def initialize(*args)
    Stringtrain::Cab.new(*args)
  end
end