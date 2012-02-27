module ActionPresenter
  module Utilities
    module Let
      extend ActiveSupport::Concern

      module ClassMethods

      private

        def let(name, &block)
          define_method name, block
        end
      end
    end
  end
end