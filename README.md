# Universal Template Engine (UTE)

Template engine to create every kind of text document using one of
supported programming languages.
For example creating HTML documents from HTML templates with Julia
programming language. 

* Independent from the type of the target text document.
* Supports several scripting languages. 
* Templates can use full power of the selected scripting language.
* Very easy to add support for a new language.
* Syntax is similar to [Django template language](https://www.djangoproject.com/).

Supported scripting languages: Julia.

## Example (Creating logarithm table in HTML)

HTML template using Julia programming language:

``` html
...
    <table style="width:20%">
      <tr align="left">
        <th>N</th>
        <th>log<sub>2</sub>N</th> 
      </tr>
      {% for n in 1:5 %}
      <tr>
        <td>{{ n }}</td>
        <td>{{ log2(n) }}</td>
      </tr>
      {% end %}
    </table>
...
```

Target HTML document:

``` html
...
    <table style="width:20%">
      <tr align="left">
        <th>N</th>
        <th>log<sub>2</sub>N</th> 
      </tr>
      <tr>
        <td>1</td>
        <td>0.0</td>
      </tr>
      <tr>
        <td>2</td>
        <td>1.0</td>
      </tr>
      <tr>
        <td>3</td>
        <td>1.584962500721156</td>
      </tr>
      <tr>
        <td>4</td>
        <td>2.0</td>
      </tr>
      <tr>
        <td>5</td>
        <td>2.321928094887362</td>
      </tr>
    </table>
...
```

## Build

Run `make` in the project directory. Only dependencies are C compiler and
Bash.

For developers,
[Flex](https://en.wikipedia.org/wiki/Flex_(lexical_analyser_generator))
lexical analyzer generator is also needed. 

## Usage

### Invocation

UTE is invoked with `bin/ute` executable as such:  
`ute <scripting-language-name> <input-template-file> <output-target-file>`

For example:

```
ute julia log-table.t.html log-table.html
```

`<scripting-language-name>` should be one of the directory names under
`language-support`.

### Template syntax

The template file can include 2 kinds of script blocks with special
syntax: `{% ... %}` and `{{ ... }}`.

The template engine runs the scripts inside these blocks. Right after
execution,`{% ... %}` is removed, and `{{ ... }}` is substituted by
the printout of the evaluated value.

## How does it work?

Let the target document type be HTML, and selected scripting
language be Julia.

The whole HTML template is translated into Julia code:
* HTML sections are wrapped by Julia print functions.
* Julia code inside `{% ... %}` stays as is.
* Julia code inside `{{ ... }}` wrapped by a code block that runs it
  and prints the result.

The generated Julia code is run to generate the target HTML document. 

## How to add support for new languages?

Read [LANGUAGE_SUPPORT.md](LANGUAGE_SUPPORT.md).

## License

Copyright&copy; 2020 Can Aknesil

This project is licensed under GNU General Public License v3.0.




