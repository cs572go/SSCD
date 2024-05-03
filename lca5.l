%{
#include<stdio.h>
#include<string.h>
typedef struct node
{
char id[10], type[10];
struct node *next;
}node;
node *head = NULL, *curr = NULL, *prev = NULL;
int flag=0;
%}
ws [ \t\n]
letter [a-zA-Z]
digit [0-9]
number {digit}+(\.{digit}+)?
header {letter}+\.{letter}+
var {letter}+({letter}|{digit}|\_)*
kw (printf|return)
dtype (int|float|double|char)
func {var}\(.*\)
characters ({letter}|{digit}|[ !@#$%^&()-=_+;':",.<>?])
string \"{characters}\"

arith [\+|\-\/|\*]
relop [<>]
punc [\(|\)|\[|\]|\{|\}|;|,]
%%
{ws}+
print(f)? {printf("%s : Print statement\n",yytext);}
\#include {printf("%s : Directive\n",yytext);}
{header} {printf("%s : Header file\n",yytext);}
{relop} {printf("%s : Relational operator\n",yytext);}
{func} {
printf("%s : Function\n",yytext);
if(flag==1)
{
strcpy(curr->id,yytext);
flag=0;
}
}
{dtype} {
printf("%s : Data type\n",yytext);
prev = curr;
curr = curr->next;
curr = (node*)malloc(sizeof(node));
prev->next=curr;
strcpy(curr->type,yytext);
flag=1;
}
{kw} {printf("%s : Keyword\n",yytext);}
{number} {printf("%s : Number\n",yytext);}
{string} {printf("%s : String\n",yytext);}
{var} {

printf("%s : Variable\n",yytext);
if(flag==1)
{
strcpy(curr->id,yytext);
flag=0;
}
}
{punc} {printf("%s : Punctuation\n",yytext);}
{arith} {printf("%s : Arithmetic operator\n",yytext);}
\= {printf("%s : Assignment operator\n",yytext);}
\/\/{characters} {printf("%s : Comment\n",yytext);}
%%
int main()
{
head = (node*)malloc(sizeof(node));
curr = head;
yyin=fopen("input.c","r");
yylex();
printf("\n\nSymbol Table:\nID\tType\n");
node *temp = head->next;
while(temp!=NULL)
{
printf("%s\t%s\n",temp->id,temp->type);
temp=temp->next;
}
yywrap();
}
extern int yywrap()
{
return(1);

}
