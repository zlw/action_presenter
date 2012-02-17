module ActionPresenter
  module ViewHelper
    extend ActiveSupport::Concern

    included do
      helper_method :present
    end

    def present(object, klass = "#{object.class}Presenter".constantize)
      yield klass.new(object, view_context) if block_given?
    end
  end
end
