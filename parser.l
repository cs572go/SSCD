%{
#include "y.tab.h"
extern int yyerror(char *str);
extern int yywrap();
extern int yyparse();
%}

%%
"while" return WHILE;
"for" return FOR;
"int" return INT;
"++" return INC;
"if" return IF;
"(" return OP;
")" return CP;
"<" |
">" |
"<=" |
">=" |
"==" |
"!=" return CMP;
"+" |
"-" |
"*" |
"/" return OPR;
([a-zA-Z])("_"|[a-zA-Z0-9])* return ID;
[0-9]+ return NUM;
";" return SC;
"=" return ASG;
" " {}

%%

int yywrap(){
    return 0;
}