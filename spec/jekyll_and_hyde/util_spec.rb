require 'spec_helper'

module JekyllAndHyde
  describe Util do
    describe "#find_task_class" do
      it "should return result for existing task" do
        class JekyllAndHyde::TestTask < Thor; end

        JekyllAndHyde::Util.find_task_class("test_task").should be
      end
    end
  end
end