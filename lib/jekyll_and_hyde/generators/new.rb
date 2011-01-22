module JekyllAndHyde
  module Generators
    class New < Thor::Group
      include Thor::Actions

      argument :app_path, :type => :string, :required => true, :desc => "The app path to generate the skeletal installation"
      desc "Generate a skeletal jekyll_and_hyde installation in [APP_PATH]"

      source_root File.expand_path('../../../', File.dirname(__FILE__))

      def make_app_path_dir
        empty_directory app_path
      end

      def copy_template_files
        directory('template', app_path)
      end
    end
  end
end