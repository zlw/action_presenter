module SimplePresenter
  module ViewHelper
    extend ActiveSupport::Concern

    included do
      helper_method :present
    end

    def present(object, klass = "#{object.class}Presenter".constantize)
      yield klass.new(object, self) if block_given?
    end
  end
end
