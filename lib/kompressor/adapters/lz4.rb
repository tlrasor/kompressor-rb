module Kompressor
  module Adapters
    class Lz4 < Kompressor::Adapter
      def compress data, **opts
        if opts[:hc] || opts[:high] || opts[:best]
          return ::LZ4.compressHC(data)
        end
        ::LZ4.compress(data)
      end
      def uncompress data, **opts
        ::LZ4.decompress(data)
      end
    end
  end
end