require 'spec_helper'
require 'support/string_presenter'
require 'support/dummy_action_controller'


describe ActionPresenter::ViewHelper do
  include ActionControllerHelper

  context "#with block" do
    it 'should call default presenter if presenter class is not given' do
      helper.present('foo') do |p|
        p.should be_instance_of StringPresenter
      end
    end

    it 'should call given presenter class' do
      klass = FoobarPresenter
      helper.present('foo', klass) do |p|
        p.should be_instance_of klass
      end
    end

    it 'should call scoped presenter if no class is given' do
      helper.present [:foo, 'foo'] do |p|
        p.should be_instance_of Foo::StringPresenter
      end
    end

    it 'should call given presenter class even if scope is given' do
      klass = FoobarPresenter
      helper.present [:foo, 'foo'], klass do |p|
        p.should be_instance_of klass
      end
    end
  end

  context "#without block" do
    it 'should return presenter instance if no block is given' do
      helper.present('foo').should be_instance_of StringPresenter
    end

    it 'should return presenter instance if scope is given' do
      helper.present([:foo, 'foo']).should be_instance_of Foo::StringPresenter
    end

    it "should return given presenter instance even if scope is given" do
      klass = FoobarPresenter
      helper.present([:foo, 'foo'], klass).should be_instance_of klass
    end
  end

  context "#present_collection" do
    it 'should call present on each element' do
      collection = ['foo', 'bar']
      presenter = helper.present_collection(collection, StringPresenter)

      presenter.should be_instance_of StringPresenter
      presenter.str.should == collection
    end
  end

  context "#private methods" do
    context "#presenter_name" do
      it 'should return constant for object' do
        helper.should_receive(:klass_name).with('foo').and_return 'String'
        helper.send(:presenter_name, 'foo').should == StringPresenter
      end

      it 'should return constant for one element array' do
        helper.should_receive(:klass_name).with(['foo']).and_return 'String'
        helper.send(:presenter_name, ['foo']).should == StringPresenter
      end

      it 'should return constant for few element array' do
        helper.should_receive(:klass_name).with([:foo, 'foo']).and_return 'Foo::String'
        helper.send(:presenter_name, [:foo, 'foo']).should == Foo::StringPresenter
      end
    end

    context "#klass_name" do
      it 'should return klass name for object' do
        helper.send(:klass_name, 'foo').should == 'String'
      end

      it "should return klass name for one element array" do
        helper.send(:klass_name, ['foo']).should == 'String'
      end

      it "should return klass name for few elements array" do
        helper.send(:klass_name, [:foo, 'foo']).should == 'Foo::String'
      end
    end
  end
end