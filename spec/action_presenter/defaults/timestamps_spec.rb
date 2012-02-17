require 'spec_helper'
require 'support/dummy_presenter'
require 'support/dummy_action_controller'

describe ActionPresenter::Defaults::Timestamps do
  include ActionControllerHelper

  let(:time) { Time.now }

  let(:object) { mock(Object, created_at: time, updated_at: time) }
  let(:template) { mock(Object) }

  let(:klass) { DummyPresenter.new(object, template) }

  it 'should return localized #created_at' do
    I18n.should_receive(:l).and_return("Fri, 17 Feb 2012 01:46:08 +0100")
    klass.created_at.should == "Fri, 17 Feb 2012 01:46:08 +0100"
  end

  it 'should return localized #updated_at' do
    I18n.should_receive(:l).and_return("Fri, 17 Feb 2012 01:46:08 +0100")
    klass.updated_at.should == "Fri, 17 Feb 2012 01:46:08 +0100"
  end

  context 'in view context' do
    let(:object) { 'foobar' }
    before { I18n.should_receive(:l).and_return 'Fri, 17 Feb 2012 01:46:08 +0100' }

    it 'should return #created_at' do
      object.should_receive(:created_at).and_return '2012-02-17 01:46:08 +0100'

      helper.present(object) do |p|
        p.created_at
      end.should == 'Fri, 17 Feb 2012 01:46:08 +0100'
    end

    it 'should return #updated_at' do
      object.should_receive(:updated_at).and_return '2012-02-17 01:46:08 +0100'

      helper.present(object) do |p|
        p.updated_at
      end.should == 'Fri, 17 Feb 2012 01:46:08 +0100'
    end
  end
end