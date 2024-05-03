%{
#include "y.tab.h"
%}

%%
"if"            { return SIF; }
"while"         { return SW; }
"("             { return OB; }
")"             { return CB; }
";"             { return SC; }
"=="|"<"|">"|"<="|">=" { return CMP; }
"="             { return ASG; }
"+"|"-"|"*"|"/" { return OP; }
[a-zA-Z]*       { return ID; }
[0-9]+          { return NUM; }
[ \t\n]         ; /* Skip whitespace */
.               { return yytext[0]; }
%%