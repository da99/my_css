
module My_CSS

  class File

    # =============================================================================
    # Class:
    # =============================================================================

    # =============================================================================
    # Instance:
    # =============================================================================

    getter path : String
    getter dir  : String
    getter name : String
    getter ext  : String

    def initialize(@path : String)
      @dir  = ::File.basename(::File.dirname(@path))
      @ext  = ::File.extname(@path).downcase
      @name = ::File.basename(@path, ::File.extname(@path))
    end # === def initialize

    def compile(outfile : String)
      args = ["--style", "compact", path]
      case
      when sass?
        args.unshift("--sass")
      when css? || scss?
        :allowed
      else
        raise Error.new("!!! {{Unknown file type}}: {{#{path}}} (#{ext})")
      end
      da_process = My_CSS::SASSC.compile args
      if da_process.success?
        ::File.write(outfile, da_process.output)
      end
      da_process
    end

    {% for x in %w[scss css sass].map(&.id) %}
      def {{x}}?
        ext == ".{{x}}"
      end
    {% end %}

  end # === class SCSS_File

end # === module My_CSS
