module JekyllAndHyde
  module Generators
    class << self
      def find_task_class(task_name)
        Thor::Util.find_class_and_task_by_namespace("#{namespace}:#{task_name}").first
      end

      def namespace
        Thor::Util.namespace_from_thor_class(self)
      end
    end
  end
end