require "./**"

module MDResume
  extend self
  def process(options)
    @options = options

    create_pdf_file  if generate_pdf?
    create_html_file if generate_html?
  end

  getter :options

  private def create_pdf_file
    converter.create_pdf_file(raw_html)
  end

  private def create_html_file
    converter.create_html_file(raw_html)
  end

  private def generate_html?
    options.fetch(:html, false)
  end

  private def generate_pdf?
    options.fetch(:pdf, false)
  end

  private def markdown_path
    options.fetch(:markdown_path)
  end

  private def css_path
    options.fetch(:css_path, File.expand_path("../../style/style.css", __FILE__))
  end

  private def raw_html
    markup.generate_html(markdown_path, css_path)
  end

  private def markup
    @markup ||= Markup.new
  end

  private def converter
    @converter ||= Converter.new(file_path)
  end

  private def file_path
    FilePath.new(markdown_path)
  end
end
