%{
FILE *yyin;
#include<stdio.h>
int a=0,b=0,c=0,d=0;
%}

%%
[a-zA-Z]+	{a++;	b=b+yyleng;}
" "|[\t]	{c++;}
[\n]	{d++;}
[^0-9a-zA-Z \t]	{b++;}
.	{;}
%%

int yywrap(){return 1;}

int main(int argc,char *argv[])
{
    yyin=fopen(argv[1],"r");
    yylex();
    fclose(yyin);
    printf("\nNumber of words = %d\n",a);
    printf("Number of characters = %d\n",b);
    printf("Number of white spaces = %d\n",c);
    printf("Number of lines = %d\n",d);
    return 0;
} 
