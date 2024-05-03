%{
    #include <stdio.h>
    extern int yylex();
    extern int yywrap();
%}

%token IF OP CP CMP OPR NUM ID ASG SC WHILE FOR INC INT

%%
start : sif | swhile | sfor;
sfor : FOR OP INT ID ASG NUM SC cmpn SC ID INC CP stmt {printf("for ok\n");}
swhile : WHILE OP cmpn CP stmt {printf("while OK\n");};
sif: IF OP cmpn CP stmt {printf("if OK\n");};
cmpn : ID CMP ID | ID CMP NUM;
stmt : ID ASG ID OPR ID SC;
%%

int yyerror(char *str){
    printf("%s",str);
}

int main(){
    yyparse();
    return 1;
}