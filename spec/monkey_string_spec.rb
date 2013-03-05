require 'spec_helper'

describe MonkeyString do
  describe MonkeyString::Introspection do
    describe '#mixed_case?' do
      it 'is true when self contains both lower and upper case letters' do
        'asdASD'.mixed_case?.should be true
      end
      
      it 'is false when self is all lower cased' do
        'asd'.mixed_case?.should be false
      end
      
      it 'is false when self is all upper cased' do
        'ASD'.mixed_case?.should be false
      end
      
      it 'is true when self is alphanumeric' do
        'asd123'.mixed_case?.should be true
      end
      
      it 'is false when self is all numeric' do
        '123'.mixed_case?.should be false
      end
    end
    
    describe '#upcased?' do
      it 'returns true when all letters upper cased' do
        'ASD'.upcased?.should be true
      end
      
      it 'returns false when not all letters upper cased' do
        'ASd'.upcased?.should be false
      end
    end
    
    describe '#downcased?' do
      it 'returns true when all letters lower cased' do
        'asd'.downcased?.should be true
      end
      
      it 'returns false when not all letters lower cased' do
        'asD'.downcased?.should be false
      end
    end
    
    describe '#alphanumeric?' do
      it 'is true when self contains letters and numbers' do
        'asd123'.alphanumeric?.should be true
      end
      
      it 'is false when self is all letters' do
        'asd'.alphanumeric?.should be false
      end
      
      it 'is false when self is all numbers' do
        '123'.alphanumeric?.should be false
      end
    end
    
    describe '#numeric?' do
      it 'is true when self is all numbers' do
        '123'.numeric?.should be true
      end
      
      it 'is false when self is all letters' do
        'asd'.numeric?.should be false
      end
      
      it 'is false when self is alphanumeric' do
        'asd123'.numeric?.should be false
      end
    end
    
    describe '#num_alpha' do
      it 'returns number of letters in self' do
        'asd'.num_alpha.should be 3
      end
      
      it 'does not count numbers' do
        'asd123'.num_alpha.should be 3
      end
    end
    
    describe '#to_alpha' do
      it 'returns just the letters in self' do
        'asd123'.to_alpha.should eq 'asd'
      end
      
      it "does not return the numbers in self" do
        'asd123'.to_alpha.should_not include '123'
      end
    end
  end
  
  describe MonkeyString::Random do
    describe '.random' do
      it 'returns one random letter if no options given' do
        String.random.size.should be 1
      end
      
      it 'returns a random lower cased letter if no options given' do
        String.random.should
      end
    
      it 'returns a random alpha string of the size given' do
        String.random(:size => 7).size.should be 7
      end
      
      it 'can return a random alpha string in mixed case' do
        String.random(:size => 7, :mixed_case => true).should be_mixed_case
      end
      
      it 'can return a random alphanumeric string' do
        String.random(:size => 7, :alphanumeric => true).should be_alphanumeric
      end
    end
  
    describe '.array' do
      it 'returns an array of letters in lower case' do
        String.array.should eq ('a'..'z').to_a
      end
      
      it 'can return an array of letters in mixed case' do
        mixed_case = [('a'..'z').to_a, ('A'..'Z').to_a].flatten
        String.array(:mixed_case => true).should eq mixed_case
      end
      
      it 'can return an array of alphanumerals' do
        alphanumerals = [('a'..'z').to_a, ('0'..'9').to_a].flatten
        String.array(:alphanumeric => true).should eq alphanumerals
      end
    end
    
    describe '#random' do
      it 'returns a random string of the same size as self' do
        'Hello'.random.size.should be 5
      end
      
      it 'returns mixed case if self is mixed case' do
        # Sufficiently long string to give better change for a numeral to be picked.
        # The random algorithm doesn't ensure that the returned string is mixed cased
        # only that it may pick an upper case letter
        ('Hello'*100).random.should be_mixed_case
      end
      
      it 'does not return mixed case if self is not' do
        'hello'.random.should_not be_mixed_case
      end
      
      it 'can return alphanumerals if self is alphanumeric' do
        # Sufficiently long string to give better change for a numeral to be picked.
        # The random algorithm doesn't ensure that the returned string has numerals
        # only that it may pick a numeral
        ('H3ll0'*500).random.should be_alphanumeric
      end
    end
  end
end
