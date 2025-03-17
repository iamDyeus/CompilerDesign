/* PROBLEM STATEMENT 1: Design a LEX Code to count the number of lines, space, tab-meta character and rest of characters in a given input pattern. */

%{
	#include<stdio.h>
	int a=0,b=0,c=0,d=0;
%}
%%
\n {a++;}
\t {b++;}
" " {c++;}
.	{d++;}
%%
int yywrap(){return 1;}
int main()
{
	yylex();
	printf("Number of new line characters = %d\n",a);
	printf("Number of tabs = %d\n",b);
	printf("Number of spaces = %d\n",c);
	printf("Number of characters = %d\n",d);
	return 0;
}
