module JekyllAndHyde
  module Actions
    def inside_app_path(config = {}, &block)
      inside app_path, config, &block
    end

    def run_command(command, config={})
      result = run(command, config)
      raise "Errors occured when running command \"#{command}\"." unless result
    end
  end
end