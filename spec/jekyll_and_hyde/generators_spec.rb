require 'spec_helper'

module JekyllAndHyde
  describe Generators do
    describe "#invoke" do
      it "should invoke the generator task with the given name" do
        args = anything()
        task = JekyllAndHyde::Generators::New.new
        task.should_receive(:invoke).with("jekyll_and_hyde:generators:task_name", [args])
        JekyllAndHyde::Generators.stub(:find_task_by).and_return(task)

        JekyllAndHyde::Generators.invoke("task_name", args)
      end
    end
  end
end