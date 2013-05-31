# SpreadsheetRails

SpreadsheetRails provides a template handler for ActionView to render
Microsoft Excel workbooks like any view.  This was heavily inspired by
Prawn::Rails (https://github.com/Whoops/prawn-rails).

## Installation

Add this line to your application's Gemfile:

    gem 'spreadsheet_rails', git: 'git://github.com/jdrnetworking/spreadsheet_rails.git'

And then execute:

    $ bundle

## Usage

Create a view template named `[action_name].xls.spreadsheet`

### Block Syntax

    spreadsheet_document(options) do |workbook|
      workbook.create_worksheet name: 'My Great Worksheet'
    end

### Override Workbook Class

You can also override the default workbook class (Spreadsheet::Workbook):

    spreadsheet_document(renderer: MyWorkbook)

and then create your workbook class:

    class MyWorkbook < Spreadsheet::Workbook
      def initialize(io = nil, options = { default_format: Spreadsheet::Format.new })
        super
        create_worksheet name: 'Another Great Worksheet'
      end
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

