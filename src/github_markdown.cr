require "http/client"
require "json"
class GithubMarkdown

	def initialize(@markdown)

	end

	def to_html
		HTTP::Client.post("https://api.github.com/markdown", nil, {text: @markdown, mode: "markdown"}.to_json).body
	end

	def self.to_html(markdown)
		GithubMarkdown.new(markdown).to_html
	end
end