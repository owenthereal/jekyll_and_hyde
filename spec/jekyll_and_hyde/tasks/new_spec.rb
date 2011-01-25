require 'spec_helper'
require 'fakefs/spec_helpers'

module JekyllAndHyde
  module Generators
    describe New do
      include FakeFS::SpecHelpers

      before(:each) do
        @new_generator = JekyllAndHyde::New.new(["app_path"], {}, {})
      end

      describe "#make_app_path_dir" do
        it "should create the given directory" do
          @new_generator.should_receive(:empty_directory).with("app_path")
          @new_generator.make_app_path_dir
        end
      end

      describe "#inside_app_path" do
        it "should have all other operations execute inside app path" do
          %W{git_clone_template git_init add_slippy_git_submodule git_add_all}.each do |method|
            @new_generator.should_receive(:inside_app_path)
            @new_generator.send(method)
          end
        end
      end
    end
  end
end