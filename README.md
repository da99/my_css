

* Shoelace: 32kb
  https://news.ycombinator.com/item?id=14898627


Intro
=====

```crystal
  require "my_css"

  sass = My_CSS.new("my.sass")
  scss = My_CSS.new("my.scss")
  css  = My_CSS.new("my.css")

  scss.sass?
  scss.scss?
  scss.css?

  scss.compile!
  css_output = scss.compile!(%w[my arsg as a Array(String)])
  File.write("my.css", css_output)
```
