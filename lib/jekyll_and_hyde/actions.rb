module JekyllAndHyde
  module Actions
    def run_command(command, config={})
      result = run(command, config)
      raise Error, "Errors occured when running command \"#{command}\"." unless result
      result
    end

    def say_status(status, message, log_status=true)
      self.shell.say_status(status, message, log_status)
    end

    def set_color(string, color, bold=false)
      self.shell.set_color(string, color, bold)
    end

    def validate_installation
      self.class.source_root(destination_root)
      find_in_source_paths("_config.yml")
    end
  end
end