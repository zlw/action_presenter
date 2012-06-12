class DummyActionController
  def self.helper_method(*args)
    nil
  end

  def view_context
    self
  end
end

module ActionControllerHelper
  extend ActiveSupport::Concern

  included do
    let(:helper) { DummyActionController.send(:include, ActionPresenter::ViewHelper).new }
  end
end