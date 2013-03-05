module MonkeyString
  module Random
    def self.included(base)
      base.extend ClassMethods
      base.send :include, InstanceMethods
    end
    
    module ClassMethods
      def random(options = {})
        options = { :size => 1 }.merge options
        
        a = array options
        s = a.size-1
        (0...options[:size]).map { a[rand(s)] }.join
      end
      
      def array(options = {})
        options = { :mixed_case => false, :alphanumeric => false }.merge options
        
        a = [('a'..'z')]
        a << ('A'..'Z') if options[:mixed_case]
        a << ('0'..'9') if options[:alphanumeric]
        a.map(&:to_a).flatten
      end
    end

    module InstanceMethods
      def random
        self.class.random :size => size, :alphanumeric => alphanumeric?, :mixed_case => mixed_case?
      end
    end
  end
end