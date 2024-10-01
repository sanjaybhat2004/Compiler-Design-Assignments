/* lexer.l */
%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
[a-zA-Z][a-zA-Z0-9]* { yylval.str = strdup(yytext); return ID; }
"="                  { return ASSIGN; }
"+"                  { return PLUS; }
"-"                  { return MINUS; }
"*"                  { return MULTIPLY; }
"("                  { return LPAREN; }
")"                  { return RPAREN; }
[ \t\n]              ; /* Skip whitespace */
.                    { printf("Unexpected character: %s\n", yytext); }
%%

int yywrap() {return 1;}