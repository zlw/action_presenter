class StringPresenter < ActionPresenter::Base
  def foobar
    'foo'
  end
end

class FoobarPresenter < ActionPresenter::Base
  def foobar
    'bar'
  end
end


module Foo
  class StringPresenter < ActionPresenter::Base
  end
end