%{

#include "y.tab.h"
#include <stdio.h>

%}

%%

[0-9]+(\.[0-9]+)? {yylval.num = atof(yytext); return NUMBER;}
"+"                  { return PLUS; }
"-"                  { return MINUS; }
"*"                  { return TIMES; }
"/"                  { return DIVIDE; }
"("                  { return LPAREN; }
")"                  { return RPAREN; }
[ \t\n]              { /* Ignore whitespace */ }
.                    { printf("Unexpected character: %s\n", yytext); }


%%

int yywrap(void) {return 1;}
