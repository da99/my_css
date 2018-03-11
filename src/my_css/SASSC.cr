
module My_CSS
  module SASSC

    extend self

    def compile(args : Array(String))
      DA_Process.new("sassc", args)
    end # === def compile

  end # === struct SASSC
end # === module My_CSS
