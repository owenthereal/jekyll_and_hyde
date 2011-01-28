module JekyllAndHyde
  class SingleTask < Thor
    include Thor::Actions
    include JekyllAndHyde::Actions
  end
end