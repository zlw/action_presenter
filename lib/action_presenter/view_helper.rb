module ActionPresenter
  module ViewHelper
    extend ActiveSupport::Concern

    included do
      helper_method :present
    end

    def present(object, klass = nil)
      klass ||= presenter_name object
      object = object.last if object.is_a? Array

      presenter = klass.new(object, view_context)

      return yield presenter if block_given?
      presenter
    end

  private

    def presenter_name(scope)
      "#{klass_name(scope)}Presenter".constantize
    end

    def klass_name(scope)
      return scope.class.to_s unless scope.is_a? Array
      return scope.first.class.to_s if scope.length == 1

      scope.map do |s|
        s.is_a?(Symbol) ? s.capitalize : s.class
      end.join('::')
    end
  end
end
