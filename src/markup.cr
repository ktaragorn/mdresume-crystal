require "markdown"
class Markup
  def generate_html(markdown_path, css_path)
    html = Markdown.to_html(File.read(markdown_path))
    html = add_head(html, css_path)

  end

  def add_head(html, css_path)
    head = "\n<head>\n<meta charset='utf-8'>\n#{stylesheet(css_path)}</head>\n"
    head + html
  end

  def stylesheet(css_path)
    "\n<style>#{File.read(css_path)}</style>\n"
  end
end
