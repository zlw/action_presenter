require 'spec_helper'
require 'support/dummy_presenter'


describe ActionPresenter::Utilities::Let do
  let(:presenter) { DummyPresenter }

  it 'should create new method' do
    presenter.should_receive :define_method do |name, block|
      name.should == :created_with_let

      block.should be_instance_of Proc
      block.call.should == 'I can create methods!!!'
    end

    presenter.class_eval do
      let(:created_with_let) { 'I can create methods!!!' }
    end
  end
end