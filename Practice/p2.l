/* Design a LEX Code to identify and print valid Identifiers of C/C++ in the given Input pattern. */


%{
    #include <stdio.h>
%}

%%  
[_a-zA-Z]([a-zA-Z0-9_])*  { printf("Valid Identifier: %s\n", yytext); }  
.*   /* Ignore everything else */  
%%

int yywrap() { return 1; }

int main() {
    yylex();  
    return 0;
}
