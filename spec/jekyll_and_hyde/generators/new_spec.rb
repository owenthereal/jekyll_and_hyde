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
        it "should create the given directory" do
          @new_generator.should_receive(:empty_directory).with("app_path")
          @new_generator.make_app_path_dir
        end
      end

      describe "#copy_template_files" do
        it "should copy all template files to the given directory" do
          template_path = File.expand_path('../../../../template', __FILE__)
          @new_generator.should_receive(:directory).with(template_path, "app_path")
          @new_generator.copy_template_files
        end
      end
    end
  end
end