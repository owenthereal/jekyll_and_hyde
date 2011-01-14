require 'spec_helper'

module JekyllAndHyde
  describe Generators do
    describe "#support_type?" do
      it "should return true for support types" do
        [JekyllAndHyde::Generators::GroupTask].each do |t|
          JekyllAndHyde::Generators.support_type?(t).should be_true
        end
      end
    end

    describe "#find_task_by" do
      it "should find task by task name" do
        task_class = mock("a_task_class")
        task_class.stub(:new)
        JekyllAndHyde::Generators.stub(:const_get).with(:TaskName).and_return(task_class)
        JekyllAndHyde::Generators.stub(:support_type?).and_return(true)

        task_class.should_receive(:new)

        JekyllAndHyde::Generators.find_task_by("task_name")
      end
    end

    describe "#invoke" do
      it "should invoke the generator task with the given name" do
        args = anything()
        task = mock("a_task")
        task.stub(:invoke)
        JekyllAndHyde::Generators.stub(:find_task_by).and_return(task)

        task.should_receive(:invoke).with("jekyll_and_hyde:generators:task_name", [args])

        JekyllAndHyde::Generators.invoke("task_name", args)
      end
    end
  end
end