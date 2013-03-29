module StyleGuide
  class StyleController < ApplicationController
    layout 'style_guide'
    before_filter :load_sections

    def index
      @current_section = @sections.first
      render :show
    end

    def show
      @current_section = @sections.detect { |section| section.id == params[:id] }
    end

    private

    def load_sections
      @application_css = StyleGuide::Engine.config.style_guide.css_files
      @sections = StyleGuide::Engine.config.style_guide.sections
    end
  end
end
