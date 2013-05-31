require 'spreadsheet'

module SpreadsheetRails
  class Railtie < Rails::Railtie
    initializer "spreadsheet_rails.register_mime_type" do
      Mime::Type.register_alias('application/vnd.ms-excel', :xls) unless Mime::Type.lookup_by_extension(:xls)
    end

    initializer "spreadsheet_rails.register_template_handler" do
      ActiveSupport.on_load(:action_view) do
        ActionView::Template.register_template_handler(:spreadsheet, SpreadsheetRails::TemplateHandler)
      end
    end

    initializer "spreadsheet_rails.include_action_view_helper" do
      ActiveSupport.on_load(:action_view) do
        ActionView::Base.send(:include, SpreadsheetRails::SpreadsheetRailsHelper)
      end
    end
  end
end
