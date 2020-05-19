require 'spreadsheet_rails/version'
require 'spreadsheet_rails/railtie' if defined?(Rails)

module SpreadsheetRails
  module SpreadsheetRailsHelper
    ##
    # Render a new or existing spreadsheet workbook
    #
    # Pass an instance of Spreadsheet::Workbook to render it directly
    #
    # Valid options:
    #  :filename: sent to client in the Content-Disposition header
    #  :renderer: subclass of Spreadsheet::Workbook to use, defaults to Spreadsheet::Workbook
    #  :io:       optional IO object pass to Spreadsheet::Workbook#initialize
    #
    # Yields the workbook object unless a spreadsheet instance is given
    def spreadsheet_document(workbook = nil, options = {})
      filename = options.delete(:filename)

      unless workbook
        klass = options.delete(:renderer) || Spreadsheet::Workbook
        klass_args = [options.delete(:io)]
        klass_args << options unless options.empty?
        workbook = klass.new(*klass_args)
        yield workbook if block_given?
      end

      disposition = "attachment;"
      disposition += %Q( filename="#{filename}") if filename
      headers['Content-Disposition'] = disposition

      render_io workbook
    end

    ##
    # Renders to a string any object that will #write to an IO object
    def render_io(writer)
      StringIO.new.tap do |io|
        writer.write(io)
      end.string
    end
  end

  class TemplateHandler
    class_attribute :default_format
    self.default_format = :pdf

    def self.call(template, source)
      "#{template.source.strip}"
    end
  end
end
