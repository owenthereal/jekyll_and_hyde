require 'spec_helper'

describe String do
  describe "#titlecase" do
    it "should return title case of any string" do
      ["task_name", "Task-name", "task_Name"].each do |name|
        name.titlecase.should == "TaskName"
      end
    end
  end
end