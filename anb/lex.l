%{
#include <stdio.h>
#include "y.tab.h"  // This will be generated by Bison
%}

%%

a       { return A; }
b       { return B; }
\n      { /* Ignore newlines */ }
.       { printf("Invalid character: %s\n", yytext); }

%%

int yywrap(void) {
    return 1;
}