module ActionPresenter
  module Defaults
    module Timestamps
      def created_at(format = :default)
        localize_time :created_at, format
      end

      def updated_at(format = :default)
        localize_time :updated_at, format
      end

    private

      def localize_time(time, format)
        I18n.l(object.try(time), format: format) if object.respond_to?(time)
      end
    end
  end
end