require 'spec_helper'
require 'support/view_helper'


describe SimplePresenter::ViewHelper do
  let(:helper) { DummyActionController.send(:include, SimplePresenter::ViewHelper).new }

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