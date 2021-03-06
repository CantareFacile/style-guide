module StyleGuide
  class Config
    attr_reader :paths, :css_files

    def self.example_glob
      StyleGuide::Engine.root.join("app", "views", "example", "*")
    end

    def initialize(options = {})
      @paths = options[:paths] || [self.class.example_glob]
      @css_files = ["application.css"]
    end

    def paths=(paths)
      if paths.is_a?(Array)
        @paths = paths
      else
        @paths = [paths]
      end
    end

    def css_files=(css_files)
      if css_files.is_a?(Array)
        @css_files = css_files
      else
        @css_files = [css_files]
      end
    end

    def sections
      StyleGuide::Section.from_paths(expanded_paths)
    end

    private

    def expanded_paths
      globbed_paths.flatten.uniq.select(&:directory?)
    end

    def globbed_paths
      paths.map { |path| Pathname.glob(path) }
    end
  end
end
