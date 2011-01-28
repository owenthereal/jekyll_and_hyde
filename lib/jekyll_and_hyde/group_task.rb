module JekyllAndHyde
  class GroupTask < Thor::Group
    include Thor::Actions
    include JekyllAndHyde::Actions

    def self.self_task
      Thor::DynamicTask.new(self.namespace.split(':').last, class_options)
    end
  end
end