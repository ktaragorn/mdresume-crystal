require "markdown"
class Markup
  def generate_html(markdown_path, css_path, github = false)
    markdown_cls = if github
      GithubMarkdown
    else
      Markdown
    end

    markdown = remove_comments(File.read(markdown_path))

    html = markdown_cls.to_html(markdown)
    html = add_head(html, css_path)
  end

  def remove_comments(markdown)
    markdown.gsub(/<!--[^(-->)]*-->/m, "")
  end

  def add_head(html, css_path)
    head = "\n<head>\n<meta charset='utf-8'>\n#{stylesheet(css_path)}</head>\n"
    head + html
  end

  def stylesheet(css_path)
    if File.exists? css_path
      "\n<style>#{File.read(css_path)}</style>\n"
    else
      puts "CSS file not found (default is ./style.css)"
      ""
    end
  end
end
