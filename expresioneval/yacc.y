%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern int yylex();
void yyerror(const char* s);
%}

%union {
    double num;
}

%token <num> NUMBER
%token PLUS MINUS TIMES DIVIDE LPAREN RPAREN

%left PLUS MINUS
%left TIMES DIVIDE

%type <num> expression

%%

calculation:
    expression                  { printf("Result: %f\n", $1); }
    ;

expression:
    NUMBER                      { $$ = $1; }
    | expression PLUS expression { $$ = $1 + $3; }
    | expression MINUS expression { $$ = $1 - $3; }
    | expression TIMES expression { $$ = $1 * $3; }
    | expression DIVIDE expression {
        if ($3 == 0) {
            yyerror("Division by zero");
            YYABORT;
        }
        $$ = $1 / $3;
    }
    | LPAREN expression RPAREN  { $$ = $2; }
    | MINUS expression %prec UMINUS { $$ = -$2; }
    ;

%%

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Enter an arithmetic expression:\n");
    yyparse();
    return 0;
}