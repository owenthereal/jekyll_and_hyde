module JekyllAndHyde
  module Util
    class << self
      def find_task_class(task_name)
        find_class_and_task_by_namespace(task_name).first
      end

      def find_class_and_task_by_namespace(task_name)
        task_name = "#{JekyllAndHyde.namespace}:#{task_name}" unless task_name.include?(":")
        Thor::Util.find_class_and_task_by_namespace(task_name)
      end
    end
  end
end