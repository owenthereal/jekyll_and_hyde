module JekyllAndHyde
  class Generate < JekyllAndHyde::Group
    argument :title, :type => :string, :required => true, :desc => "The title of the slide."
    class_option :format, :type => :string, :default => 'markdown', :desc => 'The format of the slide. It supports markdown and textile.'
    desc "Generate a slide using the defined template."

    SUPPORT_FORMATS = %W{markdown md textile}

    def create_slide
      format = options[:format]
      raise "Unsupport format #{format}, --format=#{SUPPORT_FORMATS.join(",")}." unless SUPPORT_FORMATS.include?(format)
      create_file File.join("_posts", "#{timestamp}-#{title}.#{format}")
    end

    private

    def timestamp
      Time.now.strftime("%Y-%m-%d-%H-%M-%S")
    end
  end
end