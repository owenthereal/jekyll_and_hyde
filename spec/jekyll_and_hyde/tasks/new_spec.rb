require 'spec_helper'

module JekyllAndHyde
  describe New do
    before(:each) do
      @new_task = JekyllAndHyde::New.new(["app_path"], {}, {})
    end

    describe "#make_app_path_dir" do
      it "should create the given directory" do
        @new_task.should_receive(:empty_directory).with("app_path")
        @new_task.make_app_path_dir
      end
    end

    describe "#inside_app_path" do
      it "should have all other operations execute inside app path" do
        %W{git_clone_template git_init add_slippy_git_submodule git_add_all}.each do |method|
          @new_task.should_receive(:inside_app_path)
          @new_task.send(method)
        end
      end
    end
  end
end