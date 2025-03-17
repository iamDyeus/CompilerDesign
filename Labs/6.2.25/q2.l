%{
#include <stdio.h>
%}

%%
[A]    { printf("We got A: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter Text: ");
    yylex();
    return 0;
}

