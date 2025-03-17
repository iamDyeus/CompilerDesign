/* PROBLEM STATEMENT 6: Design a LEX Code to replace all the white spaces of ‘Input.txt’ file by a single blank character and store the output in ‘Output.txt’ file.*/

%{
	#include<stdio.h>
	FILE *yyin,*yyout;
%}
%%
[ \n\t]*	{fprintf(yyout,"%s"," ");}
.	{fprintf(yyout,"%s",yytext);}
%%
int yywrap(){return 1;}
int main(int argc,char *argv[])
{
	yyin=fopen(argv[1],"r");
	yyout=fopen(argv[2],"w");
	yylex();
	fclose(yyin);
	fclose(yyout);
	return 0;
}
