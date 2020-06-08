# Language Support Manual for UTE

Language support is located under `language-support`
directory. 

To add support for a new language, all that needs to be
done is to create a new directory, named by the new language,
under `language-support`, and put the following files in it:

* **run-script-file.sh**: Contains the command to run a script file
  with the new language. It should take only one argument that is the
  script file name. 
* **script-print-pre** and **script-print-post**: 

Parts of the script written in the new language, which is used to run a script block
and print the result to standard output. 

For Julia language, the following script does the job:

```julia
print(begin
        ...
      end)
```

In this case, script-print-pre should contain `print(begin `,
script-print-post should contain ` end)`. (Be careful about the spaces)

* **script-hex-print-pre** and **script-hex-post**:

Parts of the script written in the new language, which is used to
print a string represented with a string of 2 digis hexadecimal
numbers. 

For Julia language:

```julia
print_hex_string("3c68746d6c3e")
```

In this case, script-hex-print-pre should contain
`print_hex_string("`, script-hex-print-post should contain `")`. 

* **base.X**, where X is the file extension for the new language:
  Contains code required by script-[hex]-print-{pre,post}.
  
In the Julia case, it contains the definition of `print_hex_string`
function. 
