module JekyllAndHyde
  module Generators
    autoload :New, 'jekyll_and_hyde/generators/new'

    class GroupTask < Thor::Group;
    end

    class << self
      def invoke(task_name, *args)
        task = find_task_by(task_name)
        task.invoke(task_to_invoke(task_name), args) unless task.nil?
      end

      def find_task_by(task_name)
        task_class = const_get(task_name.to_s.capitalize.to_sym)
        if !task_class.nil? && task_class.ancestors.include?(GroupTask)
          task_class.new
        else
          nil
        end
      end

      def task_to_invoke(task_name)
        "jekyll_and_hyde:generators:#{task_name}"
      end
    end
  end
end