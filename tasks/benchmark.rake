desc 'Perform Benchmark files'

namespace :benchmark do
  all = []
  puts 'Each Benchmark generates 10000 random numbers and sorts them using the specified algorithm'
  benchmarks = Dir['./lib/*.rb']
  benchmarks.each do |file|
    sym = file.scan(/^.*\/(.*)_.*$/).first.first.to_sym
    all << sym
    task sym do
      limit = ARGV.last || 10000
      puts file
      trap('SIGINT') { exit }
      Kernel.exec "ruby #{file} #{limit.to_i}"
      puts ''
    end

    task all: all
  end
end
