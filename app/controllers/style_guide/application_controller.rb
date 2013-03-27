module StyleGuide
  class ApplicationController < ActionController::Base
    def load_sections
      @application_css = StyleGuide::Engine.config.style_guide.css_files
      @sections = StyleGuide::Engine.config.style_guide.sections
    end
  end
end
