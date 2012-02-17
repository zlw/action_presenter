module ActionPresenter
  class Railtie < Rails::Railtie
    initializer 'action_presenter.view_helper' do |app|
      ActiveSupport.on_load :action_controller do
        include ActionPresenter::ViewHelper
      end
    end
  end
end