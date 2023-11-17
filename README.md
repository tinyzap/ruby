# TinyZap

[![Ruby](https://github.com/tinyzap/ruby/actions/workflows/ruby.yml/badge.svg)](https://github.com/tinyzap/ruby/actions/workflows/ruby.yml)

The easiest way to make Rails applications look great in Apple Messages, Facebook, LinkedIn, Twitter, and any other website that use Open Graph.


## Installation

From the root of your Rails application, run:

```bash
$ bundle add "tinyzap"
```

Then run:

```bash
$ rails generate tinyzap:install
```

This creates a `app/views/layout/application.opengraph.erb` file and adds `include TinyZap::Opengraph` to `ApplicationController`.

Add to your `app/views/layouts/application.html.erb` file:

```
<head>
  <%= opengraph_meta_tags %>
</head>
```

That's it for the bare minimum! A screenshot of the top part of the webpage will appear by default for all open graph images. Custom badges are where its at though, so read on my friend.

## Setting OpenGraph data

Open graph data can be set from the view or controller via the `opengraph` method.

### Controller

Here's a few ways to set opengraph data from a controller.

```ruby
class PostsController < ApplicationController
  before_action: :assign_opengraph_data

  def edit
    # This overrides the title that's set from `assign_opengraph_data`
    opengraph.title = "Editing #{@post.title}"
  end

  protected

  def assign_opengraph_data
    opengraph.title = @post.title
    opengraph.description = @post.summary
    # Displays the first image of a blog post, instead of a screenshot, for the opengraph image.
    # Assumes the image was managed via ActiveStorage.
    opengraph.image = url_for(@post.images.first)
  end
end
```

### View

Opengraph data may also be set from the view:

```erb
<%
  opengraph.title = @post.title
  opengraph.description = @post.summary
%>

<h1><%= @post.title %></h1>
<article><%= @post.body %></article>
```

## Custom badges with Rails Views

The real power in TinyZap Open Graph is creating custom badges via the `opengraph` format in your rails views. For the example below, we'll create an Open Graph badge for a blog post. Assuming a blog application has a `/posts/:id` with a view at `app/views/posts/show.html.erb`, we'd create a new view with the `opengraph` format:

```bash
$ touch ./app/views/posts/show.opengraph.erb
```

Open the file and add something like:

```erb

<h1><%= @post.title %></h1>
<article><%= truncate @post.body, length: 100 %></article>
<p>This article will take <%= time_to_read @post.body %> minutes to read</p>
```

The TinyZap screenshot service will take a screenshot of the content at this URL and use it for the Open Graph image.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
