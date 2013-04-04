require "style_guide/partial"

module StyleGuide
  class Section
    attr_reader :path, :id, :subsections

    def self.id_from_path(path)
      File.basename(path).downcase.gsub(/[^a-zA-Z0-9]/, " ").strip.gsub(/\s+/, "_")
    end

    def self.from_paths(paths)
      [*paths].reduce({}) do |sections, path|
        id = id_from_path(path)
        section = sections[id] ||= new(id, path)
        sections
      end.values
    end

    def initialize(id, path)
      @id = id
      @path = path
      @subsections = Section.from_paths Pathname.glob(path.join("*/")).select(&:directory?)
    end

    def title
      @title ||= File.basename(path).titleize
    end

    def partials?
      partial_paths.any?
    end

    def partials(view_context)
      partial_paths.map { |path| StyleGuide::Partial.new(path, self, view_context) }.sort_by { |p| p.title }
    end

    private

    def partial_paths
      @partial_paths ||= Dir.glob(File.expand_path("_*", path))
    end
  end
end
