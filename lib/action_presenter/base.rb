module ActionPresenter
  class Base
    include Defaults::Timestamps

    include Utilities::Let

    def initialize(object, template)
      @object, @template = object, template
    end

  private

    named_reader :template, as: :h
    attr_reader :object

    def self.presents(name)
      named_reader :object, as: name
    end

    def method_missing(*args, &block)
      h.send(*args, &block)
    end
  end
end