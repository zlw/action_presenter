require 'spec_helper'
require 'support/string_presenter'
require 'support/dummy_action_controller'


describe ActionPresenter::ViewHelper do
  include ActionControllerHelper

  it 'should call default presenter if presenter class is not given' do
    helper.present('foobar') do |p|
      p.foobar
    end.should == 'foo'
  end

  it 'should call given presenter class' do
    helper.present('foobar', FoobarPresenter) do |p|
      p.foobar
    end.should == 'bar'
  end

  it 'should return nil if no block is given' do
    helper.present('foobar').should be_nil
  end
end