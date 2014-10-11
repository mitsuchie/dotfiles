# coding utf8
require 'pathname'
STDOUT.sync = true

def process(solution, path)
  solution = File.expand_path(solution, path)
  logparam = '/consoleloggerparameters:ErrorsOnly;'
  command = "MSBuild.exe #{solution} /nologo /m #{logparam}"
  puts '==========================================='
  puts "commad: #{command}"
  puts '==========================================='
  res = `#{command}`
  res = res.gsub(/\[.+\]/, '')
  puts res.split('):').map { |s| s.gsub(/^ +/, '') }.join("):\n")
  # System.exit -1 if $?.exitstatus != 0
end

def search(path)
  puts path
  solutions = path.entries.select { |name| name.to_s =~ /\.sln$/ }
  process(solutions.first, path) if solutions.any?

  search(path.parent) unless path.root? || solutions.any?
  solutions
end

path = Pathname.new Dir.pwd
search(path)
