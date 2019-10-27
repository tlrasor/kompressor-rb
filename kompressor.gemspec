lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kompressor/version"

Gem::Specification.new do |spec|
  spec.name          = "kompressor"
  spec.version       = Kompressor::VERSION
  spec.authors       = ["Travis Rasor"]
  spec.email         = ["travis@thathanka.org"]

  spec.summary       = %q{Ultra simple wrapper API for common compression algorithms }
  spec.description   = %q{Ultra simple wrapper API for common compression algorithms including zlib, xz, zstd, and snappy}
  spec.homepage      = "https://github.com/tlrasor/kompressor-rb"
  spec.license       = "MIT"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/tlrasor/kompressor-rb"
  
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "benchmark-ips", "~> 2.7"
  spec.add_development_dependency "filesize", "~> 0.2.0"
end
