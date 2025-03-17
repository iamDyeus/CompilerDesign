/* PROBLEM STATEMENT 2: Design a LEX Code to identify and print valid identifier of C/C++ in a given input pattern. */
%{
	#include<stdio.h>
	int i=1;
%}
%%
[a-z A-Z _][a-z A-Z 0-9]* {;}
. {i=0;}
%%
int yywrap(){return 1;}
int main()
{
	yylex();
	if(i)
		printf("\nValid Identifier\n");
	else
		printf("\ninvalid Identifier\n");
	return 0;
}
