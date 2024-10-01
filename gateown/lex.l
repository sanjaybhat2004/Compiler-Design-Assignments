%{
#include "y.tab.h"
%}

%%

"0"         { yylval.value = 0; return BINARY; }
"1"         { yylval.value = 1; return BINARY; }
"AND"       { return AND; }
"OR"        { return OR; }
"NOT"       { return NOT; }
"("         { return LPAREN; }
")"         { return RPAREN; }
[ \t\n]     { /* Ignore whitespace */ }
.           { printf("Unexpected character: %s\n", yytext); }

%%

int yywrap(void) {
    return 1;
}