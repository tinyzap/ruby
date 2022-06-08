# Imageomatic

The easiest way to make Rails applications look great in Apple Messages, Facebook, LinkedIn, Twitter, and any other website that use Open Graph.


## Installation

From the root of your Rails application, run:

```bash
$ bundle add "imageomatic"
```

Then add to your application controller:

```ruby
class ApplicationController < ActionController::Base
  include Imageomatic::Opengraph
end
```

Add to your `app/views/layouts/application.html.erb` file:

```
<head>
  <%= opengraph_tags %>
</head>
```

That's it for basic Open Graph image support! You can see what it looks like by appending `.opengraph` to the end of a request. For example, if you have `/posts/:id`, append `/posts/:id.opengraph` and you'll get to preview what it looks like in all browsers.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
