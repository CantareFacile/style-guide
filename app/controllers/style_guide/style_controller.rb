module StyleGuide
  class StyleController < ApplicationController
    layout 'style_guide'
    before_filter :load_sections

    def index
      @section = @current_section = @sections.first
      render :show
    end

    def show
      @section = @current_section = @sections.detect { |s| s.id == section_id }
      if subsection_id
        @section = @current_subsection = @current_section.subsections.detect { |s| s.id == subsection_id }
      end
    end

    private

    def load_sections
      @application_css = StyleGuide::Engine.config.style_guide.css_files
      @sections = StyleGuide::Engine.config.style_guide.sections
    end

    def section_id
      params[:section_id] || params[:id]
    end
    def subsection_id
      if params[:section_id] && params[:id]
        params[:id]
      end
    end
  end
end
