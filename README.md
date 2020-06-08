# Universal Template Engine

Note: Still in development.

Template engine to create every kind of text document using one of
supported programming languages.
For example creating HTML documents from HTML templates with Julia
programming language. 

* Independent from the type of the target text document.
* Supports several scripting languages. 
* Templates can use full power of the selected scripting language.
* Very easy to add support for a new language.
* Syntax is similar to [Django template language](https://www.djangoproject.com/).

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

## How does it work?

Lets say the target document type is HTML, and selected scripting
language is Julia.

The whole HTML template is translated into Julia code:
* HTML sections are wrapped by Julia print functions.
* Julia code inside `{% ... %}` stays as is.
* Julia code inside `{{ ... }}` wrapped by a code block that runs it
  and prints the result.

The generated Julia code is run to generate the target HTML document. 






