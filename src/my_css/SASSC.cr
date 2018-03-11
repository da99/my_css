
module My_CSS
  module SASSC

    extend self

    def compile(args : Array(String))
      bin_name = "sassc"
      if !DA_Process.new("which", bin_name.split).success?
        raise Error.new("Not found in path: #{bin_name}")
      end

      DA_Process.new(bin_name, args)
    end # === def compile

  end # === struct SASSC
end # === module My_CSS
