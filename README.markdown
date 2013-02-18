# Cl-Rainbow

Common Lisp port of rubygem's rainbow

see. https://github.com/sickill/rainbow

## Usage

```
(setf cl-rainbow:*enabled* t)
(print (cl-rainbow:color :red "red string"))
(print (cl-rainbow:color #x5599ff "rgb color code"))

```

Color can be one of following symbols:
``` :black :red :green :yellow :blue :magenta :cyan :white :default ```

If you have 256-colors capable terminal you can also specify color in RGB which will find the nearest match from 256 colors palette.

## Installation

TODO

## lisp

* allegro cl
* clozure cl
* sbcl
* clisp
* abcl

## Copyright

Copyright (c) 2012 Takayuki Sato (takayuki.sato.dev@gmail.com)

# License

Licensed under the LLGPL License.

