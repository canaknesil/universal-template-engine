%{
  void run_script(char *yytext, int print_flag);
  void wrap_text(char *yytext);
%}

%%

\{%[^(%\})]*%\}     run_script(yytext, 0);
\{\{[^(\}\})]*\}\}  run_script(yytext, 1);

[^(\{%|\{\{)]*      wrap_text(yytext);

%%

char *script_print_pre;
char *script_print_post;
char *script_hex_print_pre;
char *script_hex_print_post;

void run_script(char *yytext, int print_flag)
{
  int len = strlen(yytext);

  if (print_flag)
    printf("%s\n", script_print_pre);
  
  for (int i=2; i<len-2; i++)
    printf("%c", yytext[i]);

  if (print_flag)
    printf("%s\n", script_print_post);
}

void wrap_text(char *yytext)
{
  int len = strlen(yytext);
  
  printf("\n");
  printf("%s", script_hex_print_pre);
  for (int i=0; i<len; i++)
    printf("%02x", (int) yytext[i]);
  printf("%s\n", script_hex_print_post);
}

int main(int argc, char *argv[])
{
  if (argc != 5) {
    printf("Scanner: wrong number of arguments !\n");
    return 1;
  }

  script_print_pre = argv[1];
  script_print_post = argv[2];
  script_hex_print_pre = argv[3];
  script_hex_print_post = argv[4];
  
  yylex();
  return 0;
}
