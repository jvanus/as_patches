# JakesDevUtils

A ruby mixin that extends the base Array object with some methods I find useful for troubleshooting data issues.

*Not for use in production.*


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jakes_dev_utils', :group => :development, git: 'https://github.com/jvanus/utilities/jakes_dev_utils'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jakes_dev_utils, git: 'https://github.com/jvanus/utilities/jakes_dev_utils'

## Usage

The examples below assume the following:

```
empty_array = []
array_with_stuff = %w{one two two three three three a b c}
array_with_one = ["thing"]
```

### .count_uniq
Returns a hash where keys are the items in the array and values are the number of times they appear in the array.

```
empty_array.count_uniq      # => {}
array_with_stuff.count_uniq # => {"one"=>1, "two"=>2, "three"=>3, "a"=>1, "b"=>1, "c"=>1}
array_with_one.count_uniq   # => {"thing"=>1}
```

### .match
Returns matching elements from the array.

```
array_with_stuff.match "o"  # => ["one", "two", "two"]
array_with_one.match "o"    # => []
```

### .sole
Returns the only element in the array. Throws an exception if the array has more or less than 1 element. This is safer than using array.first.

```
array_with_one.sole         # => "thing"

> array_with_stuff.sole
NotAnArrayOfOne: array has more than 1 object

> empty_array.sole
NotAnArrayOfOne: array is empty
```

### .select_duplicates
Returns unique duplicate items from an array.

```
array_with_stuff.select_duplicates  # => ["two", "three"]
array_with_one.select_duplicates    # => []
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jvanus/jakes_dev_utils.

