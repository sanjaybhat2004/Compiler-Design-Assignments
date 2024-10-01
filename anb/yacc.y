%{
#include <stdio.h>

extern int yylex();
void yyerror(const char *s);
%}

%token A B

%%

S: A S
 | A B
 ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    if (yyparse() == 0) {
        printf("String accepted\n");
    } else {
        printf("String rejected\n");
    }
    return 0;
}