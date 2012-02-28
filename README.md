# ActionPresenter [![Build Status](https://secure.travis-ci.org/zlw/action_presenter.png?branch=master)](http://travis-ci.org/zlw/action_presenter)

Missing link between models and views.
Use presenter pattern in Rails application without changing controllers.

**Based on *'Presenters from Scratch'* by Ryan Bates.**

## Installation

**Add `action_presenter` to Gemfile**

```ruby
gem 'action_presenter'
# or
gem 'action_presenter', git: 'git@github.com:zlw/action_presenter.git'
```

**and than install**

```bash
# for RSpec
rails generate action_presenter:intall -t rspec

# for Test::Unit
rails generate action_presenter:install -t test_unit
```

Gem was tested under Ruby 1.9.2 and 1.9.3, Rails 3.2.1

## Usage

### Creating presenter class

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

### Calling presenter

```haml
# /app/views/posts/index.html.haml
- present @post do |p|
  = p.title
  = p.content
```

It will call (by default) `PostPresenter` (assuming that @post variable is instance of Post class)

There are some ways to change default presenter class

#### 1. Pass class as second argument

```ruby
present @post, ArticlePresenter
```

It will call `ArticlePresenter` class

#### 2. Scope variable

```ruby
present [:admin, @post]
```

It will call `Admin::PostPresenter` class

**Please, keep in mind, that passing presenter class has higher priority than scope:**

```ruby
present [:admin, @post], ArticlePresenter
```

**It will also call `ArticlePresenter` class**

## Defaults

There're some default presenter methods. They're generated if object respond to those methods

### `created_at` and `updated_at`

```haml
- present @article do |p|
 = p.created_at #=> "February 17, 2012 12:30"
 = p.updated_at #=> "February 17, 2012 13:27"
```

It's also possible to change timestamps format

```haml
- present @article do |p|
  = p.created_at :short
  = p.updated_at :long
```

## Utilities

### Let

There's RSpec inspired way to define methods

```ruby
class ArticlePresenter < ActionPresenter::Base
  presents :article

  let(:link_to_title) { link_to_unless_current article.title, article_path(article) }

  let(:render_article) do
    html = ''.html_safe

    html += content_tag :h1, article.title
    html += content_tag :p, article.content

    html
  end
end
```

## Testing

### RSpec

```ruby
require 'spec_helper'

describe ArticlePresenter do
  include ActionView::TestCase::Behavior

  let(:article) { mock_model(Article) }
  let(:presenter) { ArticlePresenter.new(article, view) }
end
```

You can change RSpec configuration to include `ActionView::TestCase::Behavior` in all specs in `/spec/presenters` folder

```ruby
RSpec.configure do |config|
  # a lot of code here ...

  config.include ActionView::TestCase::Behavior, example_group: { file_path: %r{spec/presenters} }
end
```

### Test::Unit

```ruby
require 'test_helper'

class TestArticlePresenter < ActionView::TestCase
end
```

## Feature requests, contributing to project

Well, I am not sitting all day and thinking about fancy stuff that I could add to action_presenter. 
Everytime I need something I add this to my current project, than extract it to this gem and release a new version.

If you need something - please create an issue with feature request or, wchich is more welcome (my time is also limited), send pull request.

Also if you something is missing/broken, please do not think `Man, this gem sucks and its author is shitty coder` and no longer use it! Let me know about it - create an issue or send patch.

## Maintainers

* Krzysztof Zalewski (https://github.com/zlw, http://kzalewski.blogspot.com)

## License

Copyright (C) 2012 Krzysztof Zalewski

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.