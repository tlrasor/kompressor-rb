module Kompressor
  module Adapters
    class None < Kompressor::Adapter
      def compress data, **opts
        data
      end
      def uncompress data, **opts
        data
      end
    end
  end
end