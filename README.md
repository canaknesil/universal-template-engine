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

## Example

HTML template using Julia programming language:

``` html
{% title = "This is the title" %}
...
<head>
  <title> {{ title }} </title>
  ...
</head>
...
```

Target HTML document:

``` html
...
<head>
  <title> This is the title </title>
  ...
</head>
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






