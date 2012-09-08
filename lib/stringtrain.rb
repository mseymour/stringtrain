require "stringtrain/version"
require "stringtrain/cab"

module Stringtrain
  def new(*args)
    Stringtrain::Cab.new(*args)
  end
end