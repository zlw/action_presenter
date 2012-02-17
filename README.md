## ActionPresenter [![Build Status](https://secure.travis-ci.org/zlw/action_presenter.png?branch=master)](http://travis-ci.org/zlw/action_presenter)

Missing link between models and views.
Use presenter pattern in Rails application without changing controllers.

**Based on *'Presenters from Scratch'* by Ryan Bates.**

## Installation

```ruby
gem 'action_presenter'
```

or

```ruby
gem 'action_presenter', git: 'git@github.com:zlw/action_presenter.git'
```

Gem was tested under Ruby 1.9.2 and 1.9.3, Rails 3.2.1

## Usage

Create presenter class

```ruby
# /app/presenters/post_presenter.rb
class PostPresenter < ActionPresenter::Base
  presents :post

  def title
    link_to_unless_current post.title, post_path(post), class: :post_title_link
  end

  def content
    content_tag :pre, post.content
  end
end
```

You can use all view helpers without any changes. Reference to model by method with the name passed to `presents` class method.

and then use it in view

```haml
# /app/views/posts/index.html.haml
- present @post do |p|
  = p.title
  = p.content
```

If You want to change presenter class pass it as second argument

```haml
# /app/views/post/show.html.haml
- present @post, PostShowPresenter do |p|
  = p.title
```

All that without any change in any model or controller

## Defaults

There're some default presenter methods. They're generated if object respond to those methods

* `created_at` - localized date of create
* `updated_at` - localized date of last update

```haml
- present @article do |p|
 = p.created_at #=> "February 17, 2012 12:30"
 = p.updated_at #=> "February 17, 2012 13:27"
```

## Maintainers

* Krzysztof Zalewski (https://github.com/zlw, http://kzalewski.blogspot.com)

## License

Copyright (C) 2012 Krzysztof Zalewski

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.