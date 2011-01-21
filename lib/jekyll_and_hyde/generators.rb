module JekyllAndHyde
  module Generators
    class << self
      def find_task_class(task_name)
        task_class = const_get(task_name.to_s.titlecase.to_sym)
        if !task_class.nil? && support_type?(task_class)
          task_class
        else
          nil
        end
      end

      def support_type?(generator_class)
        generator_class.ancestors.include?(Thor::Base)
      end
    end
  end
end