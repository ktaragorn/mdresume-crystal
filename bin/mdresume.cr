require "option_parser"
require "../src/mdresume"
options = {} of Symbol => (Bool | String)

opts = OptionParser.new do |opts|
  opts.banner = "Usage: #{File.basename($0)} [options] file"

  opts.on("--html", "Create HTML file") do
    options[:html] = true
  end
  opts.on("--pdf", "Create PDF file") do
    options[:pdf] = true
  end

  opts.on("--css file", "Path to CSS file") do |css_path|
    options[:css_path] = css_path
  end

  opts.on("-h", "--help", "Display help") do
    puts opts
    exit
  end
end

begin
  opts.parse!
rescue OptionParser::InvalidOption
  puts opts
  exit 1
end

begin
  MDResume.process(options.merge({markdown_path: ARGV.first}))
rescue Errno::ENOENT
  puts opts
  exit 1
end
