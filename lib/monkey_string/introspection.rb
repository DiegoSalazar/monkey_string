module MonkeyString
  module Introspection
    def mixed_case?
      !upcased? && !downcased? || alphanumeric?
    end
    
    def downcased?
      eql? downcase
    end
    
    def upcased?
      eql? upcase
    end

    def alphanumeric?
      !numeric? && size > num_alpha
    end

    def numeric?
      num_alpha == 0
    end

    def num_alpha
      to_alpha.size
    end
    
    def to_alpha
      gsub(/[^a-zA-Z]/, '')
    end
  end
end
