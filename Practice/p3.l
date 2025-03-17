/* Design a LEX Code to identify and print integer and float value in given Input pattern.  */

%{
# include "stdio.h"    
%}

%%
[0-9].[0-9]*    {printf("\n--> Float : %s\n",yytext);}
[0-9]*           {printf("\n--> Integer : %s\n",yytext);}
%%


int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}