%{
#include "y.tab.h"
#include <stdio.h>
%}

%%

a {return A;}
b {return B;}
\n {}
. {printf("invalid character");}

%%

int yywrap(void) {return 1;}
