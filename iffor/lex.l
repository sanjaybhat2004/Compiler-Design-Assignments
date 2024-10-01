/* lexer.l */
%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
"if"        { return IF; }
"else"      { return ELSE; }
"for"       { return FOR; }
"("         { return LPAREN; }
")"         { return RPAREN; }
"{"         { return LBRACE; }
"}"         { return RBRACE; }
[a-zA-Z]+   { return IDENTIFIER; }
[ \t\n]+    { /* Ignore whitespace */ }
.           { return yytext[0]; }
%%
