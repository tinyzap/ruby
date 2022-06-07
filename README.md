# Imageomatic

The easiest way to make Rails applications look great in Apple Messages, Facebook, LinkedIn, Twitter, and any other website that use Open Graph.


## Installation

From the root of your Rails application, run:

```bash
bundle add "imageomatic"
```

Then run:

```bash
rails imageomatic:install
```

This command adds the following to your `ApplicationController`:

```ruby
class ApplicationController < ActionController::Base
  include Imageomatic::OpenGraph
end
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
