$thor_runner = true

class JekyllAndHyde::Runner < Thor
  def help(meth = nil)
    if meth && !self.respond_to?(meth)
      klass, task = JekyllAndHyde::Util.find_class_and_task_by_namespace(meth)
      klass.start(["-h", task].compact, :shell => self.shell)
    else
      super
    end
  end

  desc "list [SEARCH]", "List the available jekyll_and_hyde tasks (--substring means .*SEARCH)"
  method_options :substring => :boolean, :group => :string, :all => :boolean, :debug => :boolean

  def list(search="")
    search = ".*#{search}" if options["substring"]
    search = /^#{search}.*/i
    group = options[:group] || "standard"

    klasses = Thor::Base.subclasses.select do |k|
      (options[:all] || k.group == group) && k.namespace =~ search
    end

    display_klasses(klasses)
  end

  desc "version", "Show jekyll_and_hyde version"

  def version
    say "JekyllAndHyde #{JekyllAndHyde::VERSION}"
  end

  private

  def method_missing(meth, *args)
    meth = meth.to_s
    klass, task = JekyllAndHyde::Util.find_class_and_task_by_namespace(meth)
    args.unshift(task) if task
    klass.start(args, :shell => self.shell)
  end

  def self.banner(task, all = false, subcommand = false)
    "#{basename} #{task.formatted_usage(self, all, subcommand)}"
  end

  # Display information about the given klasses. If with_module is given,
  # it shows a table with information extracted from the yaml file.
  #
  def display_klasses(klasses=Thor::Base.subclasses)
    klasses -= [Thor, Thor::Runner, Thor::Group]
    raise Error, "No JekyllAndHyde tasks available" if klasses.empty?

    list = Hash.new { |h, k| h[k] = [] }
    groups = klasses.select { |k| k.ancestors.include?(Thor::Group) }

    # Get classes which inherit from Thor
    (klasses - groups).each { |k| list[k.namespace.split(":").first] += k.printable_tasks(false) }

    # Get classes which inherit from Thor::Base
    groups.map! { |k| k.printable_tasks(false).first }

    list["root"] = groups

    # Order namespaces with default coming first
    list = list.sort { |a, b| a[0].sub(/^default/, '') <=> b[0].sub(/^default/, '') }
    list.each { |n, tasks| display_tasks(n, tasks) unless tasks.empty? }
  end

  def display_tasks(namespace, list) #:nodoc:
    list.sort! { |a, b| a[0] <=> b[0] }

    say shell.set_color(namespace, :blue, true)
    say "-" * namespace.size

    print_table(list, :truncate => true)
    say
  end
end