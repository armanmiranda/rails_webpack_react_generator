require "rails/generators/base"

module React
  class PageScaffoldGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    argument :page_name, type: :string
    argument :root_component_name, type: :string, default: "page"

    class_option :component, type: :boolean, default: true

    def create_page_directory
      filepath = set_filepath
      copy_and_process_index_js(filepath)
    end

    hook_for :component do |component|
      invoke component
    end

    private
      def set_filepath
        File.join("app/javascript/#{page_name}/")
      end

      def copy_and_process_index_js(filepath)
        template "index.tt", "#{filepath}/index.js"
      end
  end
end
