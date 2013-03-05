require "monkey_string/version"

module MonkeyString
  autoload :Random, 'monkey_string/random'
  autoload :Introspection, 'monkey_string/introspection'
  
  def self.included(base)
    base.send :include, Introspection
    base.send :include, Random
  end
end

String.send :include, MonkeyString
