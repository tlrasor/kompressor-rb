module Kompressor
  module Adapters
    class Xz < Kompressor::Adapter
      # probably only necessary parameters to know
      # level: 1-9, default 6
      # extreme, default false
      # see https://mg.guelker.eu/projects/ruby-xz/doc/
      def compress data, **opts
        ::XZ.compress(data, opts)
      end
      def uncompress data, **opts
        ::XZ.decompress(data, opts)
      end
    end
  end
end