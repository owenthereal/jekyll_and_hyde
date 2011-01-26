module JekyllAndHyde
  class Group < Thor::Group
    include JekyllAndHyde::ThorExt
    include Thor::Actions
    include JekyllAndHyde::Actions
  end
end