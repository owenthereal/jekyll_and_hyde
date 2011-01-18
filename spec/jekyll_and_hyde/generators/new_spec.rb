require 'spec_helper'
require 'fakefs/spec_helpers'

module JekyllAndHyde
  module Generators
    describe New do
      include FakeFS::SpecHelpers

      before(:each) do
        @new_generator = JekyllAndHyde::Generators::New.new(["app_path"], {}, {})
      end

      describe "#make_app_path_dir" do
        it "should create given directory" do
          @new_generator.make_app_path_dir
          File.should be_directory("app_path")
        end
      end
    end
  end
end