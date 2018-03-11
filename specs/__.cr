
require "file_utils"
require "da_spec"
require "da_dev"
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

describe ".compile" do
  it "returns a DA_Process with CSS output" do
    css = %[p { color: #fff; }]
    fs {
      File.write("a.css", css)
      actual = My_CSS::File.new("a.css").compile.output.to_s
      assert actual == "#{css}\n"
    }
  end # === it "returns CSS output"

  it "returns a DA_Process with :success? == true" do
    css = %[p { color: #fff; }]
    fs {
      File.write("a.css", css)
      actual = My_CSS::File.new("a.css").compile.success?
      assert actual == true
    }
  end # === it "returns CSS output"
end # === desc ".compile!"

