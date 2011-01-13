Given /^the jekyll_and_hyde gem installed$/ do
end

When /^I run the "jh ([^"]*) ([^"]*)" command$/ do |command, parameters|
  JekyllAndHyde::Generators.invoke(command, parameters)
end

Then /^I should have a folder named "([^"]*)" created$/ do |dir_name|
  pending # express the regexp above with the code you wish you had
end