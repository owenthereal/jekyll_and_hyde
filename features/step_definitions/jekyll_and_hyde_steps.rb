Before do
  FileUtils.mkdir_p(DESTINATION_ROOT)
end

After do
  FileUtils.rm_rf(DESTINATION_ROOT)
end

Given /^the jekyll_and_hyde gem installed$/ do
end

When /^I run the "jh ([^"]*) ([^"]*)" command$/ do |command, parameters|
  @command = JekyllAndHyde::Util.find_task_class(command).new(parameters.split)
  @command.destination_root = DESTINATION_ROOT
  @command.invoke("#{JekyllAndHyde.namespace}:#{command}")
end

Then /^I should have a folder named "([^"]*)" created$/ do |folder_name|
  File.should be_directory(File.join(DESTINATION_ROOT, folder_name))
end

And /^I should have template files\/folders "([^"]*)" inside folder "([^"]*)"$/ do |template_files, folder_name|
  template_files.split(',').map { |split| split.strip }.each do |template_file|
    File.should be_exist(File.join(DESTINATION_ROOT, folder_name, template_file))
  end
end