# Universal Template Engine

Note: Still in development.

Template engine to create any kind of text documents using desired programming languages.
For example creating HTML documents from HTML templates with Julia programming language.

* Supports all kind of text documents. 
* Supports several programming languages. 
* Can be easily extended to support other languages. 
* Syntax is similar to [Django template language](https://www.djangoproject.com/).

## Example

HTML templage using Julia programming language:

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

