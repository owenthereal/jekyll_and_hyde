$thor_runner = true

class JekyllAndHyde::Runner < Thor
  def help(meth = nil)
    if meth && !self.respond_to?(meth)
      klass, task = JekyllAndHyde::Util.find_class_and_task_by_namespace(meth)
      start_task(klass, task, ["-h", task].compact)
    else
      super
    end
  end

  desc "list [SEARCH]", "List the available jekyll_and_hyde tasks by an optional [SEARCH] string."

  def list(search="")
    search = /^.*#{JekyllAndHyde.to_namespace(search)}.*/i
    klasses = Thor::Base.subclasses.select do |k|
      k.namespace =~ search
    end

    display_klasses(klasses)
  end

  desc "version", "Show jekyll_and_hyde version"

  def version
    say "JekyllAndHyde #{JekyllAndHyde::VERSION}"
  end

  private

  def method_missing(meth, *args)
    klass, task = JekyllAndHyde::Util.find_class_and_task_by_namespace(meth.to_s)
    args.unshift(task) if task
    start_task(klass, task, args)
  end

  def start_task(klass, task, args)
    if klass.nil?
      say "Don't know how to run task '#{JekyllAndHyde.trim_namespace(task)}'."
    else
      klass.start(args, :shell => self.shell)
    end
  end

  def self.banner(task, all = false, subcommand = false)
    "#{basename} #{task.formatted_usage(self, all, subcommand)}"
  end

  # Display information about the given klasses. If with_module is given,
  # it shows a table with information extracted from the yaml file.
  def display_klasses(klasses=Thor::Base.subclasses)
    klasses -= JekyllAndHyde::GroupTask.ancestors
    raise Error, "No JekyllAndHyde tasks available" if klasses.empty?

    list = Hash.new { |h, k| h[k] = [] }
    groups = klasses.select { |k| k.ancestors.include?(JekyllAndHyde::GroupTask) }

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