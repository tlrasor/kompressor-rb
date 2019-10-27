require 'zlib'

module Kompressor
  module Adapters
    class Zlib < Kompressor::Adapter
      # acceptable levels:  Zlib::NO_COMPRESSION, Zlib::BEST_SPEED, Zlib::BEST_COMPRESSION, Zlib::DEFAULT_COMPRESSION, or an integer from 0 to 9.
      # see https://ruby-doc.org/stdlib-2.6.4/libdoc/zlib/rdoc/Zlib.html#method-c-deflate
      def compress data, **opts
        if opts[:level]
          return ::Zlib::Deflate.deflate(data, opts[:level])
        end
        ::Zlib::Deflate.deflate(data)
      end
      def uncompress data, **opts
        ::Zlib::Deflate.inflate(data)
      end
    end
  end
end