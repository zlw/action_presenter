require 'spec_helper'
require 'support/dummy_presenter'
require 'support/dummy_action_controller'

describe ActionPresenter::Defaults::Timestamps do
  include ActionControllerHelper

  let(:time_now) { Time.now }
  let(:time) { 'Fri, 17 Feb 2012 01:46:08 +0100' }

  let(:object) { mock(Object, created_at: time_now, updated_at: time_now) }
  let(:template) { mock(Object) }

  let(:klass) { DummyPresenter.new(object, template) }

  it 'should return localized #created_at' do
    I18n.should_receive(:l).and_return time
    klass.created_at.should == time
  end

  it 'should return localized #updated_at' do
    I18n.should_receive(:l).and_return time
    klass.updated_at.should == time
  end

  context 'in view context' do
    let(:object) { 'foobar' }
    before { I18n.should_receive(:l).and_return time }

    it 'should return #created_at' do
      object.should_receive(:created_at).and_return time

      helper.present(object) do |p|
        p.created_at
      end.should == time
    end

    it 'should return #updated_at' do
      object.should_receive(:updated_at).and_return time

      helper.present(object) do |p|
        p.updated_at
      end.should == time
    end
  end
end