module JekyllAndHyde
  class << self
    def namespace
      Thor::Util.namespace_from_thor_class(self)
    end

    def to_namespace(str)
      str = "#{namespace}:#{str}" unless str.include?(':')
      str
    end
  end
end