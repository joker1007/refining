# Refining

This gem defines `Class#refining`.

`Class#refining` is helper of defining refinement module at inner class.

### before

```ruby
class User
  module AdministratorRoll
    refine User do
      def delete_post(name)
        "Delete: #{name}"
      end
    end
  end
end

class DeletePostContext
  using User::AdministratorRoll

  def execute
    user = User.new
    user.delete_post
  end
end
```

### after

```ruby
require 'refining'

class User
  refining :AdministratorRoll
    def delete_post(name)
      "Delete: #{name}"
    end
  end
end

class DeletePostContext
  using User::AdministratorRoll

  def execute
    user = User.new
    user.delete_post
  end
end
```

## Installation

Add this line to your application's Gemfile:

    gem 'refining'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install refining

## Contributing

1. Fork it ( https://github.com/[my-github-username]/refining/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
