module ActionPresenter
  module Defaults
    module Timestamps
      [:created_at, :updated_at].each do |timestamp|
        define_method timestamp do |format = :default|
          localize_time timestamp, format
        end
      end

    private

      def localize_time(time, format)
        I18n.l(object.try(time), format: format) if object.respond_to?(time)
      end
    end
  end
end