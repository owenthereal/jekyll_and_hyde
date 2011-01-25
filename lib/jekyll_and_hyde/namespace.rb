module JekyllAndHyde
  def self.namespace
    Thor::Util.namespace_from_thor_class(self)
  end
end