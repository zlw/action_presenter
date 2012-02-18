module Draper
  RSpec.configure do |config|
    config.include RSpec::Rails::RailsExampleGroup, example_group: { file_path: %r{spec/presenters} }

    # Access to view object
    config.include ActionView::TestCase::Behavior, example_group: { file_path: %r{spec/presenters} }

    # Access to #should render_template() etc.
    config.include RSpec::Rails::Matchers::RenderTemplate, example_group: { file_path: %r{spec/presenters} }
  end
end