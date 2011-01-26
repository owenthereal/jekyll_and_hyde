module JekyllAndHyde
  module ThorExt
    def self.included(base)
      base.extend JekyllAndHyde::ThorExt::ClassMethods
    end

    module ClassMethods
      def self_task
        Thor::DynamicTask.new(self.namespace.split(':').last, class_options)
      end
    end
  end
end