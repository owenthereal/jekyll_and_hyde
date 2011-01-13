module JekyllAndHyde
  module Generators
    class New < GroupTask
      desc "copy configuration files"

      def config
        puts "hello world"
      end

      def two
        puts "two"
      end
    end
  end
end