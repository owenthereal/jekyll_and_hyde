require 'spec_helper'

module JekyllAndHyde
  describe Generate do
    before(:each) do
      @generate_task = JekyllAndHyde::Generate.new(["test_slide"], {}, {})
    end

    describe "#timestamp" do
      it "should return timestamp separated by '-'" do
        @generate_task.send(:timestamp).to_s.scan(/\d\d\d\d-\d\d-\d\d-\d\d-\d\d-\d\d/).should_not be_empty
      end
    end

    describe "#create_slide" do
      it "should create a file" do
        @generate_task.should_receive(:create_file)
        @generate_task.create_slide
      end
    end
  end
end