# JakesDevUtils

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/jakes_dev_utils`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jakes_dev_utils', git: 'https://github.com/jvanus/utilities/jakes_dev_utils'
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

### Count Uniq
Returns a hash where keys are the items in the array and values are the number of times they appear in the array.
```
empty_array.count_uniq      # => {}
array_with_stuff.count_uniq # => {"one"=>1, "two"=>2, "three"=>3, "a"=>1, "b"=>1, "c"=>1}
array_with_one.count_uniq   # => {"thing"=>1}
```

### Match
Returns matching elements from the array.
```
array_with_stuff.match "o"  # => ["one", "two", "two"]
array_with_one.match "o"    # => []
```

### Sole
Returns the only element in the array. Throws an exception if the array has more or less than 1 element. This is safer than using array.first.
```
array_with_one.sole         # => "thing"

> array_with_stuff.sole
NotAnArrayOfOne: array has more than 1 object

> empty_array.sole
NotAnArrayOfOne: array is empty
```

### Select Duplicates
Returns unique duplicate items from an array.
```
array_with_stuff.select_duplicates  # => ["two", "three"]
array_with_one.select_duplicates    # => []
 ```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/jakes_dev_utils.

