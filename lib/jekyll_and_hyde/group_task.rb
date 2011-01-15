module JekyllAndHyde
  module Generators
    class GroupTask < Thor::Group
      include Thor::Actions

      def initialize(installation_dir)
        # args<Array[Object]>:: An array of objects. The objects are applied to their
        #                       respective accessors declared with <tt>argument</tt>.
        #
        # options<Hash>:: An options hash that will be available as self.options.
        #                 The hash given is converted to a hash with indifferent
        #                 access, magic predicates (options.skip?) and then frozen.
        #
        # config<Hash>:: Configuration for this Thor class.
        super([], {}, {})
        @installation_dir = installation_dir
      end
    end
  end
end