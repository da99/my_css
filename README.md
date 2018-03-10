

* Shoelace: 32kb
  https://news.ycombinator.com/item?id=14898627


Intro
=====

```crystal
  require "my_css"

  sass = My_CSS::File.new("my.sass")
  scss = My_CSS::File.new("my.scss")
  css  = My_CSS::File.new("my.css")

  # .sass?
  # .scss?
  # .css?

  scss.compile!
  css_output = scss.compile!(%w[my arsg as a Array(String)])
  File.write("my.css", css_output)
```
