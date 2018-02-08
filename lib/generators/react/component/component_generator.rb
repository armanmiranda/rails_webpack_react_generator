require "rails/generators/base"

module React
  class ComponentGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    
    argument :page_name, type: :string
    argument :component_name, type: :string

    class_option :module_pack, type: :boolean, default: true

    def create_component_file
      filepath = set_filepath
      copy_and_process_template(filepath)
    end

    hook_for :module_pack do |module_pack|
      invoke module_pack, [page_name]
    end

    private
      def copy_and_process_template(filepath)
        template "template_component.tt", filepath
      end

      def set_filepath
        sanitize_component_name
        File.join("app/javascript/#{page_name}/components/#{component_name}.jsx")
      end

      def sanitize_component_name
        component_name.delete!(".jsx") if component_name.include? ".jsx"
      end
  end
end
