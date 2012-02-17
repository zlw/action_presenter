class DummyActionController
  def self.helper_method(name)
    nil
  end

  def view_context
    self
  end
end

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