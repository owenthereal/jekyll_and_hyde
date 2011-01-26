require 'spec_helper'

describe JekyllAndHyde do
  describe "#namespace" do
    it "should return namespace separated by ':'" do
      JekyllAndHyde.namespace.should == "jekyll_and_hyde"
    end
  end

  describe "#to_namespace" do
    it "should append to namespace when string doesn't contain a colon" do
      JekyllAndHyde.to_namespace("str").should == "jekyll_and_hyde:str"
    end

    it "shouldn't append to namespace when string constains a colon" do
      JekyllAndHyde.to_namespace("test:str").should == "test:str"
    end
  end
end