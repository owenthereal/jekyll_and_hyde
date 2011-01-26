module JekyllAndHyde
  class Generate < JekyllAndHyde::Group
    argument :title, :type => :string, :required => true, :desc => "The title of the slide."
    class_option :format, :type => :string, :default => 'markdown', :desc => 'The format of the slide. It can be "markdown" or "textile".'
    desc "Generate a slide using the defined template."

    def create_slide
      create_file File.join("_posts", "#{timestamp}-#{title}.#{options[:format]}")
    end

    private

    def timestamp
      Time.now.strftime("%Y-%m-%d-%H-%M-%S")
    end
  end
end