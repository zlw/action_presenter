module ActionPresenter
  module Defaults
    module Timestamps
      def created_at
        localize_time :created_at
      end

      def updated_at
        localize_time :updated_at
      end

    private

      def localize_time(time)
        I18n.l(object.try(time)) if object.respond_to?(time)
      end
    end
  end
end