require 'spec_helper'

module JekyllAndHyde
  describe Generators do
    describe "#namespace" do
      it "should return namespace separated by ':'" do
        JekyllAndHyde::Generators.namespace.should == "jekyll_and_hyde:generators"
      end
    end

    describe "#find_task_class" do
      it "should create a task if it finds it" do
        class JekyllAndHyde::Generators::TestTask < Thor; end

        JekyllAndHyde::Generators.find_task_class("test_task").should be
      end
    end
  end
end