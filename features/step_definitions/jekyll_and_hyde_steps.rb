require 'fakefs/safe'

Before do
  FakeFS.activate!
end

After do
  FakeFS.deactivate!
end

Given /^the jekyll_and_hyde gem installed$/ do
end

When /^I run the "jh ([^"]*) ([^"]*)" command$/ do |command, parameters|
  @command = JekyllAndHyde::Generators.find_task_class(command).new(parameters.split)
  @command.invoke("jekyll_and_hyde:generators:#{command}")
end

Then /^I should have a folder named "([^"]*)" created$/ do |dir_name|
  File.should be_directory(dir_name)
end