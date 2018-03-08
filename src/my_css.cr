
module My_CSS

  extend self

  def compile!(args : Array(String))
    DA_Process.new("sassc", args).success!.output
  end # === def compile

  class File

    # =============================================================================
    # Class:
    # =============================================================================

    # =============================================================================
    # Instance:
    # =============================================================================

    getter file     : String
    getter route    : String
    getter name     : String
    getter ext      : String

    def initialize(@file : String)
      @route    = ::File.basename(::File.dirname(@file))
      @name     = ::File.basename(@file, ".scss")
      @ext      = ::File.extname(@file).downcase
    end # === def initialize

    def compile!
      DA_Dev.orange! "=== {{Compiling}}: BOLD{{#{file}}}"
      args = ["--style", "compact", file]
      case
      when sass?
        args.unshift("--sass")
      when css? || scss?
        :allowed
      else
        DA_Dev.red! "!!! {{Unknown file type}}: {{#{file}}} (#{ext})"
        exit 1
      end
      compile! args
    end

    def compile!(args : Array(String))
      My_CSS.compile!(args)
    end

    {% for x in %w[scss css sass].map(&.id) %}
      def {{x}}?
        ext == ".{{x}}"
      end
    {% end %}

  end # === class SCSS_File


end # === class My_CSS
