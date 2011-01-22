require 'spec_helper'

module JekyllAndHyde
  describe Generators do
    describe "#support_type?" do
      it "should return true for support types" do
        [JekyllAndHyde::Generators::New].each do |t|
          JekyllAndHyde::Generators.support_type?(t).should be_true
        end
      end
    end

    describe "#find_task_class" do
      it "should create a task if it finds it" do
        task_class = mock("a_task_class")
        JekyllAndHyde::Generators.stub(:const_get).with(:TaskName).and_return(task_class)
        JekyllAndHyde::Generators.stub(:support_type?).and_return(true)
        JekyllAndHyde::Generators.find_task_class("task_name").should == task_class
      end
    end
  end
end