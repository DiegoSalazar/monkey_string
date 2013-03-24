require "monkey_string/version"

module MonkeyString
  require 'monkey_string/random'
  require 'monkey_string/introspection'
  
  def self.included(base)
    base.send :include, Introspection
    base.send :include, Random
  end
end

String.send :include, MonkeyString
