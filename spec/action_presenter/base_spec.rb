require 'spec_helper'
require 'support/dummy_presenter'


describe ActionPresenter::Base do
  let(:template) { mock(Object) }
  let(:object) { mock(Object) }

  let(:klass) { DummyPresenter }
  let(:presenter) { klass.new(object, template) }

  context '#instance_variables' do
    it 'should have @object instance variable' do
      presenter.instance_variables.should include :@object
    end

    it 'should have @template instance variable' do
      presenter.instance_variables.should include :@template
    end
  end

  context '#accessors' do
    it 'should have #h reader method for @template' do
      presenter.should respond_to :h
    end

    it 'should respond to reader method with the same name as parameter to #presents' do
      klass.presents :dummy
      presenter.should respond_to :dummy
    end
  end

  context '#method_missing' do
    it 'should pass every missing method to @template object' do
      presenter.h.should_receive(:non_existing_method).and_return('i am here')
      presenter.non_existing_method.should == 'i am here'
    end
  end
end