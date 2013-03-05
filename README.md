# MonkeyString

Some neat monkey patches on Ruby's beloved String class.

## Installation

Add this line to your application's Gemfile:

    gem 'monkey_string'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install monkey_string

## Usage

### Random String Generator

```ruby
String.random
# => 's' # a random letter

String.random size: 7
# => 'tcoqntv' # 7 random lower cased letters

String.random size: 7, mixed_cased: true
# => 'osPiyeM' # 7 random mixed case letters

String.random size: 7, alphanumeric: true
# => 'rcwq3l2' # 7 random alphanumerals

'as4vLm2W'.random
# => 'e4vmHjku' # random letters of the same size and mixed-case-ness
```

### String Introspection

```ruby
'asd'.mixed_case? # => true
'asd'.upcased? # => false
'asd'.downcased? # => true
'asd'.alphanumeric? # => false
'asd123'.alphanumeric? # => true
'asd'.numeric? # => false
'123'.numeric? # => true
'asd123'.to_alpha # => 'asd'
'asd123'.num_alpha # => 3
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
