% {
#include <stdio.h>
      % }

        % token IF WHILE OB CB SC CMP ASG OP ID NUM

        % % start : sif |
    sw;

sif : IF OB ID CMP NUM CB expression { printf("ROOT REACHED"); }

sw : WHILE OB ID CMP NUM CB expression { printf("ROOT REACHED"); }

expression : ID ASG ID OP NUM SC | ID ASG NUM SC;

% %

    int main()
{
    yyparse();
    return 0;
}

int yywrap()
{
    return 1;
}
