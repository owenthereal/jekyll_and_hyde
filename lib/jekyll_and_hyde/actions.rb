module JekyllAndHyde
  module Actions
    def inside_app_path(config = {}, &block)
      inside app_path, config, &block
    end

    def run_command(command, config={})
      result = run(command, config)
      raise "Errors occured when running command \"#{command}\"." unless result
    end

    def say_status(status, message, log_status=true)
      self.shell.say_status(status, message, log_status)
    end

    def set_color(string, color, bold=false)
      self.shell.set_color(string, color, bold)
    end
  end
end