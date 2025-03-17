PROBLEM STATEMENT 3: Design a LEX Code to identify and print integer and float value in a given input pattern.

CODE:
%{
           #include<stdio.h>
           char integers[100][10],floating[100][10];
           int i=0,j=0;
%}
%%
[0-9]+[.][0-9]+	 {strcpy(floating[i],yytext);	i++;}
[0-9]+	{strcpy(integers[j],yytext);	j++;}
. {;}
%%
int yywrap(){return 1;}
int main()
{
          yylex();
          printf("\nInteger Values: ");
          for(int k=0;k<j;k++)
          printf("%s ",integers[k]);
          printf("\nFloat Values: ");
          for(int k=0;k<i;k++)
          printf("%s ",floating[k]);
          printf("\n");
}
