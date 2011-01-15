module JekyllAndHyde
  module Generators
    class New < GroupTask
      desc "Generates a skeletal jekyll_and_hyde installation"

      def make_installation_dir
        empty_directory @installation_dir
      end
    end
  end
end