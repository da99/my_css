
require "file_utils"
require "da_spec"
require "da_dev"
require "inspect_bang"
require "../src/my_css"

extend DA_SPEC

def fs
  dir = "tmp/out/my_css"
  FileUtils.rm_rf dir
  Dir.mkdir_p dir
  Dir.cd(dir) {
    yield
  }
end # === def fs

def inspect(x : DA_Process)
  return x if x.success?
  STDERR.puts x.error
  x
end

describe ".compile" do
  it "returns a DA_Process with :success? == true" do
    css = <<-EOF
    p
      color: #fff
    EOF
    fs {
      File.write("a.sass", css)
      actual = My_CSS::File.new("a.sass").compile("a.css")
      assert actual.success? == true
    }
  end # === it "returns CSS output"

  it "returns a DA_Process with CSS output" do
    css = <<-EOF
    p
      color: #fff
    EOF
    fs {
      File.write("a.sass", css)
      actual = My_CSS::File.new("a.sass").compile("a.css").output.to_s
      assert actual == "p { color: #fff; }\n"
    }
  end # === it "returns CSS output"


  it "writes to file" do
    css = <<-EOF
    p
      color: #fff
    EOF
    fs {
      File.write("a.sass", css)
      My_CSS::File.new("a.sass").compile("a.css")
      expect = "p { color: #fff; }"
      assert File.read("a.css")[expect]? == expect
    }
  end # === it "returns CSS output"
end # === desc ".compile!"

