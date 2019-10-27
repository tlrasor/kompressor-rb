module Kompressor
  module Adapters
    class Snappy < Kompressor::Adapter
      def compress data
        ::Snappy.deflate(data)
      end
      def uncompress data
        ::Snappy.inflate(data)
      end
    end
  end
end