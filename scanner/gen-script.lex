%{
  void start_token(int print_flag);
  void end_token(int print_flag);
  void process_char(char c);
  void process_eof();
%}

%%

"{%"    start_token(0);
"%}"    end_token(0);
"{{"    start_token(1);
"}}"    end_token(1);
<<EOF>> process_eof(); return 0;

.       process_char(yytext[0]);
\n      process_char(yytext[0]);


%%

#include "ds.h"

void process_text(char *text);
void process_script(char *script, int print_flag);

char *script_print_pre;
char *script_print_post;
char *script_hex_print_pre;
char *script_hex_print_post;

DS *section_text;

void start_token(int print_flag)
{
  process_text(ds_cast_string(section_text));
  ds_reset(section_text);
}

void end_token(int print_flag)
{
  process_script(ds_cast_string(section_text), print_flag);
  ds_reset(section_text);
}

void process_char(char c)
{
  ds_push_char(section_text, c);
}

void process_eof()
{
  process_text(ds_cast_string(section_text));
  ds_reset(section_text);
}

void process_text(char *text)
{
  int len = strlen(text);
  
  printf("\n");
  printf("%s", script_hex_print_pre);
  for (int i=0; i<len; i++)
    printf("%02x", (int) text[i]);
  printf("%s\n", script_hex_print_post);
}

void process_script(char *script, int print_flag)
{
  int len = strlen(script);

  if (print_flag)
    printf("\n%s", script_print_pre);
  
  for (int i=0; i<len; i++)
    printf("%c", script[i]);

  if (print_flag)
    printf("%s\n", script_print_post);
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

  section_text = ds_create();
  
  yylex();

  ds_destroy(section_text);
  return 0;
}

void error_exit(char *msg)
{
  fprintf(stderr, "%s\n", msg);
  exit(1);
}
