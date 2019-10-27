require 'singleton'

module Kompressor

  class AdapterTypeError < StandardError; end

  class Adapter
    DEFAULT_ADAPTER = (ENV['KOMPRESSOR_DEFAULT_ADAPTER'] || "zlib").to_sym

    include Singleton
    
    def self.for type = DEFAULT_ADAPTER, strict = false
      begin
        const = type.to_s.split("_").collect(&:capitalize).join
        klass = Kompressor::Adapters.const_get(const)
        return klass.instance
      rescue NameError => e
        if strict
          raise AdapterTypeError.new("No adapter for #{type}")
        else
          return Kompressor::Adapters::Zlib.instance
        end
      end
    end

  end
end