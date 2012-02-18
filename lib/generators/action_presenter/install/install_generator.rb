module ActionPresenter
  class InstallGenerator < Rails::Generators::Base
    desc <<-DESC
    Description:
      Generate application and test/spec presenter folders
    DESC

    class_option 'test-framework', type: :string, default: :rspec, aliases: '-t', desc: 'Test framework (RSpec or Test::Unit)'

    def build_presenters_folder
      empty_directory 'app/presenters'

      case options['test-framework']
        when 'rspec'
          empty_folder 'spec/presenters'
        when 'test_unit'
          empty_folder 'test/unit/presenters'
      end
    end
  end
end