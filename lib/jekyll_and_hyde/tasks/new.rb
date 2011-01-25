module JekyllAndHyde
  class New < Thor::Group
    include Thor::Actions

    JEKYLL_AND_HYDE_TEMPLATE_GIT_REPO = 'git://github.com/jingweno/jekyll_and_hyde_template.git'
    SLIPPY_GIT_REPO = 'git://github.com/jingweno/slippy.git'

    argument :app_path, :type => :string, :required => true, :desc => "The app path to generate the skeletal installation"
    desc "Generate a skeletal jekyll_and_hyde installation in [APP_PATH]"

    def make_app_path_dir
      empty_directory app_path
    end

    # TODO: pass in the url as parameter
    def git_clone_template
      inside_app_path do
        run "git clone #{JEKYLL_AND_HYDE_TEMPLATE_GIT_REPO} ."
        remove_file('.git')
      end
    end

    def git_init
      inside_app_path do
        run "git init"
      end
    end

    def add_slippy_git_submodule
      inside_app_path do
        run "git submodule add #{SLIPPY_GIT_REPO}"
      end
    end

    def git_add_all
      inside_app_path do
        run "git add ."
      end
    end

    private

    def inside_app_path(config = {}, &block)
      inside app_path, config, &block
    end
  end
end