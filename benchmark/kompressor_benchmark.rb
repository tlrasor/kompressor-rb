require_relative 'benchmark_helper'

compressors = [:lz4, :snappy, :xz, :zstd, :zlib]

puts "loading data..."
data_sets = {ebook: File.read(EBOOK)}
puts "completed!"

compressors.each do |compressor|
  data_sets.each_key do |test_data|
    puts "compress #{compressor} #{test_data}"
    data = data_sets[test_data]
    compressed = Kompressor.compress(data, compressor: compressor)
    ratio = (data.length/compressed.length.to_f).round(4)
    puts "compressed size:  #{compressed.length}"
    puts "compression ratio #{ratio}"
    puts ""
  end
end

Benchmark.ips do |benchmark|
  compressors.each do |compressor|
    data_sets.each_key do |test_data|
      benchmark.report("compress #{compressor}-#{test_data}") do
        data = data_sets[test_data]
        Kompressor.compress(data, compressor: compressor)
      end
    end
  end
  benchmark.compare!
end
puts "All benchmarks completed"