module JekyllAndHyde
  class New < Thor::Group
    include JekyllAndHyde::ThorExt
    include Thor::Actions
    include JekyllAndHyde::Actions

    JEKYLL_AND_HYDE_TEMPLATE_GIT_REPO = 'git://github.com/jingweno/jekyll_and_hyde_template.git'
    SLIPPY_GIT_REPO = 'git://github.com/jingweno/slippy.git'

    argument :app_path, :type => :string, :required => true, :desc => "The app path to generate the skeletal installation"
    class_option :github, :type => :boolean, :desc => "Create branching information for a GitHub project page, details in http://pages.github.com/."
    desc "Generate a skeletal jekyll_and_hyde installation in [APP_PATH]."

    def make_app_path_dir
      empty_directory app_path
    end

    # TODO: pass in the url as parameter
    def git_clone_template
      inside_app_path do
        run_command "git clone #{JEKYLL_AND_HYDE_TEMPLATE_GIT_REPO} ."
        remove_file('.git')
      end
    end

    def git_init
      inside_app_path do
        run_command "git init"
      end
    end

    def add_slippy_git_submodule
      inside_app_path do
        run_command "git submodule add #{SLIPPY_GIT_REPO}"
      end
    end

    def git_add_all
      inside_app_path do
        run_command "git add ."
      end
    end

    def create_git_hub_page
      if options.github?
        inside_app_path do
          create_github_page_branch()
          say
          print_next_steps()
        end
      end
    end

    private

    def create_github_page_branch
      run_command 'git commit -am "Template files generated by jekyll_and_hyde."'
      run_command 'git checkout -b gh-pages'
      run_command 'git branch -d master'
      self.shell.say_status :create, 'branch "gh-pages" for GitHub project page, details in http://pages.github.com/.'
    end

    def print_next_steps
      next_step_string = "Next steps:"
      say self.shell.set_color(next_step_string, :blue, true)
      say "-" * next_step_string.size
      say 'git remote add origin git@github.com:your_github_username/your_git_repo.git'
      say 'git push origin gh-pages'
    end
  end
end