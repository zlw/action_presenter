class DummyActionController
  def self.helper_method(name)
    nil
  end
end

class StringPresenter < SimplePresenter::Base
  def foobar
    'foo'
  end
end

class FoobarPresenter < SimplePresenter::Base
  def foobar
    'bar'
  end
end