%{
  void run_script(char *yytext, int print_flag);
  void wrap_text(char *yytext);
%}

%%

\{%[^(%\})]*%\}     run_script(yytext, 0);
\{\{[^(\}\})]*\}\}  run_script(yytext, 1);

[^(\{%|\{\{)]*      wrap_text(yytext);

%%

void run_script(char *yytext, int print_flag)
{
  int len = strlen(yytext);

  if (print_flag)
    printf("\nprint(begin ");
  
  for (int i=2; i<len-2; i++)
    printf("%c", yytext[i]);

  if (print_flag)
    printf(" end)\n");
}

void wrap_text(char *yytext)
{
  int len = strlen(yytext);
  
  printf("\n");
  printf("print_hex_string(\"");
  for (int i=0; i<len; i++)
    printf("%02x", (int) yytext[i]);
  printf("\")\n");
}

int main()
{
  yylex();
}
