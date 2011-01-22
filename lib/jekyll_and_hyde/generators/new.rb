module JekyllAndHyde
  module Generators
    class New < Thor::Group
      include Thor::Actions

      SLIPPY_GIT_REPO = 'git://github.com/jingweno/slippy.git'

      argument :app_path, :type => :string, :required => true, :desc => "The app path to generate the skeletal installation"
      desc "Generate a skeletal jekyll_and_hyde installation in [APP_PATH]"

      source_root File.expand_path('../../../', File.dirname(__FILE__))

      def make_app_path_dir
        empty_directory app_path
      end

      def copy_template_files
        directory('template', app_path)
      end

      def git_init
        inside app_path do
          run "git init"
        end
      end

      def add_slippy_git_submodule
        inside app_path do
          run "git submodule add #{SLIPPY_GIT_REPO}"
        end
      end
    end
  end
end