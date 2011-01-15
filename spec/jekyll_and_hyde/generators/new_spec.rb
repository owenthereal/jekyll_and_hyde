require 'spec_helper'
require 'fakefs/spec_helpers'

module JekyllAndHyde
  module Generators
    describe New do
      include FakeFS::SpecHelpers

      before(:each) do
        @new_generator = JekyllAndHyde::Generators::New.new("installation_dir")
      end

      describe "#make_home_dir" do
        it "should create given directory" do
          @new_generator.make_installation_dir
          File.should be_directory("installation_dir")
        end
      end
    end
  end
end