module JekyllAndHyde
  module Generators
    class << self
      def invoke(task_name, *args)
        task = find_task_by(task_name)
        task.invoke(task_to_invoke(task_name), args) unless task.nil?
      end

      def find_task_by(task_name)
        task_class = const_get(task_name.to_s.titlecase.to_sym)
        if !task_class.nil? && support_type?(task_class)
          task_class.new
        else
          nil
        end
      end

      def support_type?(generator_class)
        generator_class.ancestors.include?(GroupTask)
      end

      def task_to_invoke(task_name)
        "jekyll_and_hyde:generators:#{task_name}"
      end
    end
  end
end