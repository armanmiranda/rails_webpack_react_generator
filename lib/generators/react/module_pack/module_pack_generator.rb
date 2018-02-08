require "rails/generators/base"

module React
  class ModulePackGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    argument :page_name, type: :string

    class_option :detached, type: :boolean, default: false, aliases: :d,
                 desc: "Puts the import into a new file named after the page_name"

    def perform
      filepath = set_filepath
      create_or_edit_webpack_module(filepath)
    end

    private
      def create_or_edit_webpack_module(filepath)
        append_to_file "#{filepath}/#{(options["detached"] ? page_name : "application")}.js",
                       "\nimport \"#{page_name}\""
      end

      def set_filepath
        File.expand_path("app/javascript/packs")
      end
  end
end
