describe String do
  describe "#titlecase" do
    it "should return title case of any string" do
      "task_name".titlecase.should == "TaskName"
      "Task-name".titlecase.should == "TaskName"
      "task_Name".titlecase.should == "TaskName"
    end
  end
end