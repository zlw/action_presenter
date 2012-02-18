## 3rd party libs
require 'active_support/core_ext/string'
require 'active_support/concern'

require 'named_accessors'

## Version
require 'action_presenter/version'

## Default fields
require 'action_presenter/defaults/timestamps'

## Base presenter class and view helpers
require 'action_presenter/base'
require 'action_presenter/view_helper'

## Railtie
require 'action_presenter/railtie' if defined? Rails

## RSpec integration
require 'action_presenter/rspec_integration' if defined?(RSpec) && defined?(RSpec::Rails)



module ActionPresenter
end
