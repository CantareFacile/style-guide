require "rails/generators"

module StyleGuide
  class InstallGenerator < ::Rails::Generators::Base
    desc "Style Guide installation generator"
    def install
      configure_application
      mount_style_guide
    end

    no_tasks do
      def application_rb
        @application_rb ||= File.open(application_rb_path).read
      end

      def routes_rb
        @routes_rb ||= File.open(routes_rb_path).read
      end

      def default_partial_path
        'Rails.root.join("app/views/style-guide/**/*")'
      end
    end

    private
    def guardfile_path
      Rails.root.join("Guardfile")
    end

    def application_rb_path
      Rails.root.join("config", "application.rb")
    end

    def routes_rb_path
      Rails.root.join("config", "routes.rb")
    end

    def configure_application
      unless application_rb && application_rb.include?("config.style_guide.paths")
        application("config.style_guide.paths << #{default_partial_path} if defined?(StyleGuide)")
      end
    end

    def mount_style_guide
      unless routes_rb && routes_rb.include?("mount StyleGuide::Engine")
        route(%(mount StyleGuide::Engine => "/style-guide" if defined?(StyleGuide)))
      end
    end
  end
end
