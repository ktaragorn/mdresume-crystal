class Converter
  def initialize(file_path)
    @html_path = file_path.html_path
    @pdf_path = file_path.pdf_path
  end

  def create_html_file(html)
    File.write(html_path, html)
  end

  def create_pdf_file(html)
    create_html_file(html)

    `wkhtmltopdf  \
      --encoding UTF-8 \
      --page-size Letter \
      --quiet \
      '#{html_path}' \
      '#{pdf_path}'`

    File.delete(html_path)
  end

  getter :html_path, :pdf_path
end
