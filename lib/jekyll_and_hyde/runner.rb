$thor_runner = true

class JekyllAndHyde::Runner < Thor
  desc "new [APP_PATH]", "Generate a skeletal jekyll_and_hyde installation in [APP_PATH]"
  method_options :force => :boolean
  def new(name)

  end

  desc "generate GENERATOR [args] [options]", "Generate new code using a GENERATOR"


  desc "version", "Show jekyll_and_hyde version"
  def version
    say "JekyllAndHyde #{JekyllAndHyde::VERSION}"
  end

  private

  def self.banner(task, all = false, subcommand = false)
    "#{basename} #{task.formatted_usage(self, all, subcommand)}"
  end
end