%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
void yyerror(const char* s);
%}

%union {
    int value;
}

%token <value> BINARY
%token AND OR NOT LPAREN RPAREN

%left OR
%left AND
%right NOT

%type <value> expr

%%

calculation:
    expr                    { printf("Result: %d\n", $1); }
    ;

expr:
    BINARY                  { $$ = $1; }
    | expr AND expr         { $$ = $1 && $3; }
    | expr OR expr          { $$ = $1 || $3; }
    | NOT expr              { $$ = !$2; }
    | LPAREN expr RPAREN    { $$ = $2; }
    ;

%%

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Enter a logical expression:\n");
    yyparse();
    return 0;
}