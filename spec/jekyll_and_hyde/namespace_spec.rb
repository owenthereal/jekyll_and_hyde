require 'spec_helper'

describe JekyllAndHyde do
  describe "#namespace" do
    it "should return namespace separated by ':'" do
      JekyllAndHyde.namespace.should == "jekyll_and_hyde"
    end
  end
end