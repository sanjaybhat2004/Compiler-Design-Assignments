%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char* s);
%}

%token IF ELSE FOR LPAREN RPAREN LBRACE RBRACE IDENTIFIER

%%

program: statement
       | program statement
       ;

statement: if_statement
         | for_statement
         | LBRACE program RBRACE
         | IDENTIFIER
         ;

if_statement: IF LPAREN condition RPAREN statement
            | IF LPAREN condition RPAREN statement ELSE statement
            ;

for_statement: FOR LPAREN condition RPAREN statement
             ;

condition: IDENTIFIER
         ;

%%

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
    exit(1);
}

int main() {
    yyparse();
    return 0;
}