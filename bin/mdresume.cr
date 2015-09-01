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

  opts.on("--github", "Use Github flavored markdown using their api, instead of the inbuilt markdown parser") do
    options[:github] = true
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

if ARGV.any?
  MDResume.new(options.merge({markdown_path: ARGV.first})).process
else
  puts "Path to the markdown file has to be provided"
end
# begin

# rescue Errno::ENOENT
#   puts opts
#   exit 1
# end
