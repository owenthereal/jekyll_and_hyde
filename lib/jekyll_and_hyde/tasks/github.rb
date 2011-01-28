module JekyllAndHyde
  class Github < JekyllAndHyde::GroupTask
    desc "Create branching information for GitHub Project Pages, details in http://pages.github.com/."

    def validate_current_installation
      validate_installation
    end

    def check_uncommited_files
      output = run_command 'git status', :capture => true
      raise Error, "There are uncommited changes. Please commit them first." unless output.include?("nothing to commit")
    end

    def create_github_page_branch
      run_command 'git checkout -b gh-pages'
      run_command 'git branch -d master'
      say_status :create, 'branch "gh-pages" for GitHub project page, details in http://pages.github.com/.'
      say
    end

    def print_next_steps
      next_step_string = "Next steps:"
      say set_color(next_step_string, :blue, true)
      say "-" * next_step_string.size
      say 'git remote add origin git@github.com:your_github_username/your_git_repo.git'
      say 'git push origin gh-pages'
      say
    end
  end
end