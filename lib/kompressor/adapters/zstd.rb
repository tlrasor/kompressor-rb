module Kompressor
 module Adapters
    class Zstd < Kompressor::Adapter
      # opts :level default is 0
      def compress data, **opts
        if opts[:level] || opts[:compression_level]
          return ::Zstd.compress(data, opts[:level])
        end
        ::Zstd.compress(data)
      end
      def uncompress data, **opts
        ::Zstd.decompress(data)
      end
    end
  end
end