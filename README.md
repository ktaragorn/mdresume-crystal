# Markdown Resume

Generates your resume out of the provided markdown.

Code bootstraped from https://github.com/arturoherrero/biteydown.
The hope for this project is both to explore the language, and provide an easy way to use it (binary instead of git clone as in biteydown)

## Installation

Download and copy the binary from the latest release(TODO) into some folder on your path
Install wkhtmltopdf if you want to generate pdf

## Usage

    $ mdresume -help
    Usage: mdresume [options] markdown_file.md
            --html                       Create HTML file
            --pdf                        Create PDF file
            --css file                   Path to CSS file
        -h, --help                       Display help

    $ mdresume --html --pdf example/curriculum.md
    $ mdresume --pdf example/curriculum.md
    $ mdresume --pdf --css style/style.css example/curriculum.md

## Style
You can customize the look and feel of text and headings in your document using the `style/style.css` file or a custom CSS file. First is transformed the Markdown document to HTML file and then apply the style. It's a little bit hacky, but works fine.

Markdown is a lightweight markup language designed as an easy-to-read, easy-to-write plain text format and then convert it to structurally valid HTML; therefore, CSS selectors can be used to customize the curriculum.

![image](cv-css-selectors.png)

CSS works by associating rules with HTML elements. In this case, there are a little group of selectors that can be used: `h1-h6`, `blockquote`, `a`, `li`, `code`, `strong`, `em`, `img`. You cannot use id or class selectors to create rules that apply to elements.


[Markdown]: http://daringfireball.net/projects/markdown/

## Development

TODO: Write instructions for development

## Contributing

1. Fork it ( https://github.com/ktaragorn/mdresume-crystal/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [ktaragorn](https://github.com/[ktaragorn]) [Karthik T] - creator, maintainer
