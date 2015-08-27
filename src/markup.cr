require "markdown"
class Markup
  def generate_html(markdown_path, css_path)
    html = Markdown.to_html(File.read(markdown_path))
    add_stylesheet!(html, css_path)
    add_head!(html)
  end

  def add_head!(html)
    head = "\n<head>\n<meta charset='utf-8'>\n</head>\n"
    head + html
  end

  def add_stylesheet!(html, css_path)
    style = "\n<style>#{File.read(css_path)}</style>\n"
    style + html
  end
end
