require "kompressor/version"
require "kompressor/adapter"

require "kompressor/adapters/none"
require "kompressor/adapters/zlib"

module Kompressor
  class Error < StandardError; end

  def self.compress data, compressor: :zlib, strict: false
    Adapter.for(compressor, strict).compress(data)
  end

  def self.try_require path
    begin
      require path
      return true
    rescue LoadError
      return false
    end
  end

  if try_require "lz4-ruby"; require "kompressor/adapters/lz4" end
  if try_require "snappy"; require "kompressor/adapters/snappy" end
  if try_require "xz"; require "kompressor/adapters/xz" end
  if try_require "zstd-ruby"; require "kompressor/adapters/zstd" end  
end

